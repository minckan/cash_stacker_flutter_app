import 'package:cash_stacker_flutter_app/auth/util/auth_type.dart';
import 'package:cash_stacker_flutter_app/auth/viewmodels/auth_view_model.dart';
import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            buildLoginButton(
              type: LoginType.kakao,
              context: context,
              ref: ref,
            ),
            // buildLoginButton(type: LoginType.naver, onPressed: () {}),
            // buildLoginButton(type: LoginType.google, ),
            // buildLoginButton(type: LoginType.apple,),
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

  IconButton buildLoginButton({
    required LoginType type,
    required BuildContext context,
    required WidgetRef ref,
  }) {
    return IconButton(
      onPressed: () => ref
          .read(authViewModelProvider.notifier)
          .auth(context: context, loginType: LoginType.kakao),
      icon: loginIcon[type] ?? const Text('No image'),
      iconSize: 160,
    );
  }
}
