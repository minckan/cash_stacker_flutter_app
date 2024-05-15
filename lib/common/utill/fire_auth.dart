import 'package:cash_stacker_flutter_app/common/screen/root_tab.dart';
import 'package:cash_stacker_flutter_app/common/utill/fire_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';

Future<bool> createUserWithEmailAndPwd(
    {required int id, required String email}) async {
  try {
    final emailAddress = email;
    final password = 'A!@$id';
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );

    // fire store에 set
    createUser(credential);
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> loginWithEmailAndPwd({
  required String email,
  required int id,
}) async {
  try {
    final value = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: 'A!@$id');
    return true;
  } catch (e) {
    print('Error occurred: $e');
    return false;
  }
}
