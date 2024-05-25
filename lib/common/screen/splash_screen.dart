import 'dart:async';

import 'package:cash_stacker_flutter_app/auth/screen/login_screen.dart';
import 'package:cash_stacker_flutter_app/common/screen/root_tab.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2));

    User? user = FirebaseAuth.instance.currentUser;

    if (!mounted) return;

    try {
      print(user);
      if (user != null) {
        await user.reload();
        user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          await ref
              .read(workspaceViewModelProvider.notifier)
              .loadWorkspace(user.uid);
          if (!mounted) return;
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const RootTab()),
              (route) => false);
        }
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
      }
    } catch (e) {
      print('error: $e');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: const Text(
          'cash stacker',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
