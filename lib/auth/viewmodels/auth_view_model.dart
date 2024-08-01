// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:cash_stacker_flutter_app/auth/screen/login_screen.dart';
import 'package:cash_stacker_flutter_app/auth/util/auth_type.dart';
import 'package:cash_stacker_flutter_app/common/repository/user_repository.dart';
import 'package:cash_stacker_flutter_app/common/screen/root_tab.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';

import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cash_stacker_flutter_app/swaggers/openapi.dart' as openapi;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart'
    as kakao_user;

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, openapi.User?>(
        (ref) => AuthViewModel(ref));

class AuthViewModel extends StateNotifier<openapi.User?> {
  final Ref _ref;

  AuthViewModel(this._ref) : super(null) {
    loadUser();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final kakao_user.UserApi kakaoUserApi = kakao_user.UserApi.instance;
  openapi.User? _user;

  openapi.User? get user => _user;

  Future<void> loadUser() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      final user =
          await _ref.read(userRepositoryProvider).getUser(id: firebaseUser.uid);
      if (user.data != null) {
        state = user.data;
      }
    }
  }

  Future<void> auth(
      {required BuildContext context, required LoginType loginType}) async {
    switch (loginType) {
      case LoginType.kakao:
        await _loginWithKakao(context);
        break;
      case LoginType.google:
        await _loginWithGoogle(context);
        break;
      default:
    }
  }

  Future<void> _loginWithGoogle(BuildContext context) async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      await _loginToFirebase(context, userCredential, LoginType.google);
    } catch (e) {
      logger.e('Google Sign in error: $e');
    }
  }

  Future<void> _loginWithKakao(BuildContext context) async {
    // 카카오톡 실행 가능 여부 확인
    // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
    if (await kakao_user.isKakaoTalkInstalled()) {
      try {
        final user = await kakao_user.UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공');
        final UserCredential userCredential =
            await makeKakaoUserCredential(user);
        await _loginToFirebase(context, userCredential, LoginType.kakao);
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          final user =
              await kakao_user.UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공');
          final UserCredential userCredential =
              await makeKakaoUserCredential(user);
          await _loginToFirebase(context, userCredential, LoginType.kakao);
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        final user = await kakao_user.UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
        final UserCredential userCredential =
            await makeKakaoUserCredential(user);
        await _loginToFirebase(context, userCredential, LoginType.kakao);
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  }

  Future<UserCredential> makeKakaoUserCredential(
      kakao_user.OAuthToken user) async {
    // oidc 인증
    var provider = OAuthProvider('oidc.cashstakcer');

    // 크레덴셜 만들기
    final AuthCredential credential = provider.credential(
      accessToken: user.accessToken,
      idToken: user.idToken,
    );

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    return userCredential;
  }

  Future<void> _loginToFirebase(
    BuildContext context,
    UserCredential userCredential,
    LoginType loginType,
  ) async {
    try {
      final firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        final userRepository = _ref.read(userRepositoryProvider);

        final user = await userRepository.getUser(id: firebaseUser.uid);

        state = user.data;

        if (state?.userId != null) {
          _ref
              .read(workspaceViewModelProvider.notifier)
              .loadWorkspace(state!.userId!);
        }

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const RootTab()),
            (route) => false);
      }
    } catch (e) {
      logger.e('Firebase login error: $e');
    }
  }

  Future<void> _handleCreateUserError(User firebaseUser) async {
    try {
      await firebaseUser.delete();
    } catch (e) {
      logger.e('[Firebase Auth delete error]: $e');
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await _auth.signOut();
      state = null;
      _ref.read(workspaceViewModelProvider.notifier).clearWorkspace();

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
    } catch (e) {
      logger.e('Logout error: $e');
    }
  }
}
