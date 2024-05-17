import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/screen/root_tab.dart';
import 'package:cash_stacker_flutter_app/common/utill/fire_auth.dart';
import 'package:cash_stacker_flutter_app/common/utill/fire_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

enum LoginType { kakao, apple, google, naver }

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashScreenBackground,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/img/logo.jpeg',
              height: 220,
            ),
            const SizedBox(
              height: 30,
            ),
            LoginButton(type: LoginType.kakao, context: context),
            // LoginButton(type: LoginType.naver, onPressed: () {}),
            // LoginButton(type: LoginType.google, ),
            // LoginButton(type: LoginType.apple,),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '로그인 없이 둘러보기',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  final Map<LoginType, Widget> loginIcon = {
    LoginType.kakao: SvgPicture.asset(
      'assets/img/kakao-login.svg',
    ),
    LoginType.apple: SvgPicture.asset(
      'assets/img/apple-login.svg',
    ),
    LoginType.google: SvgPicture.asset(
      'assets/img/google-login.svg',
    ),
    LoginType.naver: SvgPicture.asset(
      'assets/img/naver-login.svg',
    ),
  };

  IconButton LoginButton(
      {required LoginType type, required BuildContext context}) {
    return IconButton(
      onPressed: () => login(context),
      icon: loginIcon[type] ?? const Text('No image'),
      iconSize: 160,
    );
  }

  Future<Map<String, dynamic>?> loginWithKakao() async {
    // 카카오톡 실행 가능 여부 확인
    // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
    if (await isKakaoTalkInstalled()) {
      try {
        final user = await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공 : $user');
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return {};
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          final user = await UserApi.instance.loginWithKakaoAccount();

          print('카카오계정으로 로그인 성공 : ${user.scopes}');
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        final user = await UserApi.instance.me();
        return {'id': user.id, 'email': user.kakaoAccount?.email};
        print('카카오계정으로 로그인 성공 : $user');
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
    return null;
  }

  loginWithGoogle() async {}

  loginWithApple() async {}

  login(BuildContext context) async {
    // 0. get email address from social media
    final user = await loginWithKakao();
    if (user != null) {
      // 1. check email in fire_store
      final hasUser = await checkDBUser(user['email']);
      // 2. has user
      if (hasUser) {
        //
      }
      // 3. route to root tab
      // =================
      // 2. has not user
      // 2-1. create user in fire auth
      else {
        await createUserWithEmailAndPwd(id: user['id'], email: user['email']);
        final successLogin =
            await loginWithEmailAndPwd(email: user['email'], id: user['id']);
        // await createUser()
        // if (success) {
        // 3. route to root tab
        if (successLogin) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const RootTab()),
            (route) => false,
          );
        }
        // }
      }
    }
  }
}
