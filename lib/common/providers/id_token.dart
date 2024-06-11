import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

// FirebaseAuth 인스턴스를 제공하는 Provider
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

// ID 토큰을 저장할 StateProvider
final idTokenProvider = StateProvider<String?>((ref) {
  return null;
});

// ID 토큰을 업데이트하는 함수
Future<void> updateIdToken(WidgetRef ref) async {
  final firebaseAuth = ref.read(firebaseAuthProvider);
  final user = firebaseAuth.currentUser;
  if (user != null) {
    final idToken = await user.getIdToken();
    ref.read(idTokenProvider.notifier).state = idToken;

    // 테스트용 토큰 뽑아내는 로직
    // if (idToken != null) {
    //   const int chunkSize = 1000; // 한 번에 출력할 문자열의 길이
    //   for (int i = 0; i < idToken.length; i += chunkSize) {
    //     int end = (i + chunkSize < idToken.length)
    //         ? i + chunkSize
    //         : idToken.length;
    //     print(idToken.substring(i, end));
    //   }
    // }
  }
}
