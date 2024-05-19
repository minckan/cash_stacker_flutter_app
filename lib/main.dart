import 'package:cash_stacker_flutter_app/common/screen/root_tab.dart';
import 'package:cash_stacker_flutter_app/common/screen/splash_screen.dart';

import 'package:cash_stacker_flutter_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();
  KakaoSdk.init(
    nativeAppKey: dotenv.get('KAKAO_APP_KEY'),
    javaScriptAppKey: dotenv.get('KAKAO_JAVASCRIPT_KEY'),
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Notosans',
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
    ),
  );
}
