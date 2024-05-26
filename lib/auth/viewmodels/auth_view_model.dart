import 'package:cash_stacker_flutter_app/auth/model/user_model.dart';
import 'package:cash_stacker_flutter_app/auth/screen/login_screen.dart';
import 'package:cash_stacker_flutter_app/auth/util/auth_type.dart';
import 'package:cash_stacker_flutter_app/common/screen/root_tab.dart';
import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:cash_stacker_flutter_app/home/model/asset_summary_model.dart';
import 'package:cash_stacker_flutter_app/home/model/workspace_model.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/asset_summary_view_model.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart'
    as kakao_user;
import 'package:logger/logger.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, UserModel?>(
    (ref) => AuthViewModel(ref));

class AuthViewModel extends StateNotifier<UserModel?> {
  final Ref _ref;

  AuthViewModel(this._ref) : super(null) {
    loadUser();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final kakao_user.UserApi kakaoUserApi = kakao_user.UserApi.instance;
  UserModel? _user;

  UserModel? get user => _user;

  Future<void> loadUser() async {
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
    try {
      if (await kakao_user.isKakaoTalkInstalled()) {
        final user = await kakao_user.UserApi.instance.loginWithKakaoTalk();
        await _loginToFIrebase(context, user);
      } else {
        final user = await kakao_user.UserApi.instance.loginWithKakaoAccount();
        await _loginToFIrebase(context, user);
      }
    } catch (e) {
      logger.e('Kakao login error: $e');
    }
  }

  Future<void> _loginToFIrebase(
      BuildContext context, kakao_user.OAuthToken user) async {
    try {
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
          final workspaceId = 'workspace_${firebaseUser.uid}';
          try {
            // 유저가 존재하지 않으면
            _user = UserModel(
              uid: firebaseUser.uid,
              email: firebaseUser.email ?? '',
              role: UserRole.keyUser,
              profileImage: firebaseUser.photoURL ?? '',
              displayName: firebaseUser.displayName ?? '',
              workspaceId: workspaceId,
            );
            // 신규 유저 추가
            await FirebaseFirestore.instance
                .collection('users')
                .doc(_user!.uid)
                .set(
                  _user!.toJson(),
                  SetOptions(merge: true),
                );
          } catch (e) {
            logger.e('[User create error]: $e');
            await _handleCreateUserError(firebaseUser);
            return;
          }

          // 신규 워크스페이스 추가
          try {
            final workspace = Workspace(
              id: workspaceId,
              members: [firebaseUser.uid],
            );

            await FirebaseFirestore.instance
                .collection('workspaces')
                .doc(workspaceId)
                .set(workspace.toJson());
            _ref
                .read(workspaceViewModelProvider.notifier)
                .setWorkspace(workspace);

            final assetSummary = AssetSummary(month: getMonth(DateTime.now()));

            _ref
                .read(assetSummaryProvider.notifier)
                .addAssetSummary(workspaceId, assetSummary);
          } catch (e) {
            logger.e('[Workspace create error]: $e');
            await FirebaseFirestore.instance
                .collection('users')
                .doc(_user!.uid)
                .delete();
            await _handleCreateUserError(firebaseUser);
            return;
          }
        } else {
          state = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
          _ref
              .read(workspaceViewModelProvider.notifier)
              .loadWorkspace(state!.uid);
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
