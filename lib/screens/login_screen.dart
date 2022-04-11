import 'package:flutter/material.dart';
import 'package:streaky/widgets/onboarding_design.dart';

import '/screens/screens.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OnboardingDesign(
          heading: 'Enter your mobile number',
          detailText: 'We will send you an OTP on this number',
          child: Row(
            children: [
              _inputTextField(first: true, last: false),
              _inputTextField(first: false, last: false),
              _inputTextField(first: false, last: false),
              _inputTextField(first: false, last: false),
              _inputTextField(first: false, last: false),
              _inputTextField(first: false, last: false),
              _inputTextField(first: false, last: false),
              _inputTextField(first: false, last: false),
              _inputTextField(first: false, last: true),
            ],
          ),
          buttonText: 'Send OTP',
          onbuttonPressed: () {
            Navigator.of(context).pushNamed(
              OtpScreen.routeName,
              arguments: _textController.text,
            );
          },
        ),
      ),
    );
  }

  _inputTextField({required bool first, required bool last}) {
    return Container(
      margin: const EdgeInsets.only(right: 3),
      height: 80,
      child: AspectRatio(
        aspectRatio: .45,
        child: TextFormField(
          readOnly: false,
          // controller: _textController,
          autofocus: true,
          onChanged: (input) {
            if (input.length == 1 && last == false) {
              // _textController.text = input;
              FocusScope.of(context).nextFocus();

              print(_textController.text);
            }
            if (input.isEmpty && first == false) {
              // _textController.text = _textController.text;
              FocusScope.of(context).previousFocus();

              print(_textController.text);
            }
          },
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          cursorColor: const Color(0xffE6A929),
          decoration: const InputDecoration(
            counter: Offstage(),
          ),
        ),
      ),
    );
  }
}
