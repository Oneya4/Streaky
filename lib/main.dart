import 'package:flutter/material.dart';
import 'package:streaky/screens/personal_info_screen.dart';
import '/screens/screens.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'screens/screens.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}
// FlutterNativeSplash.remove();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streaky',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: const ColorScheme.light().copyWith(
          primary: const Color(0xffE6A929),
          secondary: const Color(0xff142CFF),
        ),
      ),
      home: const OnboardingScreen(),
      routes: {
        WatchOnboardingVideo.routeName: (context) =>
            const WatchOnboardingVideo(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        OtpScreen.routeName: (context) => const OtpScreen(),
        PersonalInfoScreen.routeName: (ctx) => const PersonalInfoScreen(),
      },
    );
  }
}
