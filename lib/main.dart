import 'package:flutter/material.dart';
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
        primarySwatch: Colors.amber,
      ),
      home: const OnboardingScreen(),
      routes: {
        WatchOnboardingVideo.routeName: (context) =>
            const WatchOnboardingVideo(),
      },
    );
  }
}
