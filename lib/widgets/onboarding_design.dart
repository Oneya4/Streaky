import 'package:flutter/material.dart';

class OnboardingDesign extends StatelessWidget {
  final String heading;
  final String detailText;
  final Widget child;
  final String buttonText;
  final VoidCallback onbuttonPressed;

  const OnboardingDesign({
    Key? key,
    required this.heading,
    required this.detailText,
    required this.child,
    required this.buttonText,
    required this.onbuttonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: deviceSize.height * .1,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/banner.png'),
              ),
            ),
          ),
          Text(
            heading,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            detailText,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 25),
          child,
          const SizedBox(height: 35),
          ElevatedButton(
            child: Text(buttonText),
            onPressed: onbuttonPressed,
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              primary: const Color(0xffE6A929),
            ),
          ),
        ],
      ),
    );
  }
}
