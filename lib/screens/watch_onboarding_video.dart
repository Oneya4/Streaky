import 'package:flutter/material.dart';

class WatchOnboardingVideo extends StatefulWidget {
  static const routeName = 'watch-onboarding';
  const WatchOnboardingVideo({Key? key}) : super(key: key);

  @override
  State<WatchOnboardingVideo> createState() => _WatchOnboardingVideoState();
}

class _WatchOnboardingVideoState extends State<WatchOnboardingVideo> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: deviceSize.height * .64,
              decoration: const BoxDecoration(
                color: Color(0xffF9E9C9),
                image: DecorationImage(
                  alignment: Alignment.bottomCenter,
                  image: AssetImage('assets/video-image.png'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text.rich(
                      TextSpan(
                        text: 'Stay organized with your ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: 'revisions.',
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          child: const Text('Watch video'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(horizontal: 23),
                            primary: const Color(0xffE6A929),
                          ),
                        ),
                        MaterialButton(
                          child: const Text('Skip to login'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
