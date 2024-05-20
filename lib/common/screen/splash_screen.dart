import 'dart:async';

import 'package:cash_stacker_flutter_app/auth/screen/login_screen.dart';
import 'package:cash_stacker_flutter_app/common/screen/root_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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

    if (user != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const RootTab()), (route) => false);
    } else {
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
