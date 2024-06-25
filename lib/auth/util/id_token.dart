import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<String> getIdToken() async {
  User? user = _auth.currentUser;
  if (user != null) {
    // forceRefresh를 true로 설정하여 새로운 ID 토큰을 가져옵니다.
    final idToken = await user.getIdToken(true);
    if (idToken != null) {
      return idToken;
    } else {
      throw Exception('No id token');
    }
  } else {
    throw Exception('No user is currently signed in.');
  }
}
