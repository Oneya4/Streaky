import 'package:flutter/material.dart';
import 'package:streaky/screens/watch_onboarding_video.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xffF9E9C9),
                image: DecorationImage(image: AssetImage('assets/bgimage.png')),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(WatchOnboardingVideo.routeName);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffE6A929),
                        Color(0xffF3D494),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    size: 65,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('tap');
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              color: const Color(0xffF9E9C9),
              child: const Text(
                'Skip to login',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
