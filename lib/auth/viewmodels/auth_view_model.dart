import 'package:cash_stacker_flutter_app/auth/model/user_model.dart';
import 'package:cash_stacker_flutter_app/auth/screen/login_screen.dart';
import 'package:cash_stacker_flutter_app/auth/util/auth_type.dart';
import 'package:cash_stacker_flutter_app/common/screen/root_tab.dart';
import 'package:cash_stacker_flutter_app/home/model/workspace_model.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, UserModel?>(
    (ref) => AuthViewModel(ref));

class AuthViewModel extends StateNotifier<UserModel?> {
  final Ref _ref;

  AuthViewModel(this._ref) : super(null) {
    _loadUser();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserApi kakaoUserApi = UserApi.instance;
  UserModel? _user;

  UserModel? get user => _user;

  Future<void> _loadUser() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      final DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get();

      if (userDoc.exists) {
        state = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
        _ref
            .read(workspaceViewModelProvider.notifier)
            .loadWorkspace(state!.uid);
      }
    }
  }

  Future<void> auth(
      {required BuildContext context, required LoginType loginType}) async {
    switch (loginType) {
      case LoginType.kakao:
        await _loginWithKakao(context);

        break;
      default:
    }
  }

  Future<void> _loginWithKakao(BuildContext context) async {
    if (await isKakaoTalkInstalled()) {
      final user = await UserApi.instance.loginWithKakaoTalk();
      _loginToFIrebase(context, user);
    } else {
      final user = await UserApi.instance.loginWithKakaoAccount();
      _loginToFIrebase(context, user);
    }
  }

  Future<void> _loginToFIrebase(BuildContext context, OAuthToken user) async {
    // oidc 인증
    var provider = OAuthProvider('oidc.cashstakcer');

    // 크레덴셜 만들기
    final AuthCredential credential = provider.credential(
      accessToken: user.accessToken,
      idToken: user.idToken,
    );

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    final firebaseUser = userCredential.user;

    if (firebaseUser != null) {
      final DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get();

      if (!userDoc.exists) {
        // 유저가 존재하지 않으면
        _user = UserModel(
          uid: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          role: UserRole.keyUser,
          profileImage: firebaseUser.photoURL ?? '',
          displayName: firebaseUser.displayName ?? '',
          workspaceId: 'workspace_${firebaseUser.uid}',
        );
        // 신규 유저 추가
        await FirebaseFirestore.instance
            .collection('users')
            .doc(_user!.uid)
            .set(
              _user!.toJson(),
              SetOptions(merge: true),
            );

        // 신규 워크스페이스 추가
        final workspace = Workspace(
            id: 'workspace_${firebaseUser.uid}',
            // assets: [],
            // transactions: [],
            members: [state!.uid],
            totalAmount: 0);

        await FirebaseFirestore.instance
            .collection('workspaces')
            .doc('workspace_${firebaseUser.uid}')
            .set(workspace.toJson());
        _ref.read(workspaceViewModelProvider.notifier).setWorkspace(workspace);
      } else {
        state = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
        _ref
            .read(workspaceViewModelProvider.notifier)
            .loadWorkspace(state!.uid);
      }

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const RootTab()), (route) => false);
    }
  }

  Future<void> logout(BuildContext context) async {
    await _auth.signOut();
    state = null;
    _ref.read(workspaceViewModelProvider.notifier).clearWorkspace();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
  }
}
