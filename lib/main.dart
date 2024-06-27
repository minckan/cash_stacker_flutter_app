import 'package:cash_stacker_flutter_app/common/screen/splash_screen.dart';
import 'package:cash_stacker_flutter_app/common/utill/shared_preferences.dart';

import 'package:cash_stacker_flutter_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  KakaoSdk.init(
    nativeAppKey: dotenv.get('KAKAO_APP_KEY'),
    javaScriptAppKey: dotenv.get('KAKAO_JAVASCRIPT_KEY'),
  );

  const List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  GoogleSignIn googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: 'your-client_id.apps.googleusercontent.com',
    scopes: scopes,
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  String? fcmToken = await FirebaseMessaging.instance.getToken();
  if (fcmToken != null) {
    SharedPreferencesUtil.saveString(
        SharedPreferencesUtil.fcmTokenKey, fcmToken);
  }

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Notosans',
        appBarTheme:
            const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ko', 'KO')],
      locale: const Locale('ko'),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
