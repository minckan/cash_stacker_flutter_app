import 'dart:async';

import 'package:cash_stacker_flutter_app/auth/screen/login_screen.dart';
import 'package:cash_stacker_flutter_app/auth/util/id_token.dart';
import 'package:cash_stacker_flutter_app/common/const/storage.dart';
import 'package:cash_stacker_flutter_app/common/providers/global/connectivity_provider.dart';
import 'package:cash_stacker_flutter_app/common/screen/root_tab.dart';
import 'package:cash_stacker_flutter_app/common/utill/custom_alert.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:cash_stacker_flutter_app/common/utill/shared_preferences.dart';

import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // FirebaseAuth.instance.signOut();
    _initDynamicLinks();
    _checkLoginStatus();
  }

  Future<void> _initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      // Navigator.pushNamed(context, dynamicLinkData.link.path);
      print('successed init dynamic links: $dynamicLinkData');
    }).onError((error) {
      print('onLink error');
    });
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    User? user = FirebaseAuth.instance.currentUser;

    if (!mounted) return;

    try {
      if (user != null) {
        await user.reload();
        user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          final idToken = await getIdToken();
          await ref
              .read(workspaceViewModelProvider.notifier)
              .loadWorkspace(user.uid);

          final workspaceId = ref.read(workspaceViewModelProvider)?.workspaceId;
          if (workspaceId != null) {
            await SharedPreferencesUtil.saveString(
                SharedPreferencesUtil.workspaceId, workspaceId);
            await storage.write(key: ACCESS_TOKEN_KEY, value: idToken);

            if (!mounted) return;

            _navigateToHome();
          }
        }
      } else {
        _navigateToLogin();
      }
    } catch (e) {
      logger.e('error: $e');
      _navigateToLogin();
    }
  }

  void _navigateToHome() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const RootTab()), (route) => false);
  }

  void _navigateToLogin() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final isOnline = ref.watch(connectivityProvider);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!isOnline && context.mounted) {
          showCustomAlertDialog(
            context: context,
            title: 'Network Error',
            content: '인터넷 연결을 확인해주세요.',
            isSingleButton: true,
            onConfirmed: () {},
          );
        }
      });
      return Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: const Text(
          'cash stacker',
          style: TextStyle(fontSize: 32),
        ),
      );
    });
  }
}
