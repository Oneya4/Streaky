import 'package:flutter/material.dart';
import 'package:streaky/screens/personal_info_screen.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = 'otp';

  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final _contact = ModalRoute.of(context)!.settings.arguments;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: deviceSize.height * .1,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/banner.png'),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back'),
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      primary: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  TweenAnimationBuilder(
                    tween: Tween(begin: 60.0, end: 0),
                    duration: const Duration(seconds: 60),
                    builder: (context, value, child) {
                      final count = double.parse(value.toString());
                      return count == 0
                          ? TextButton(
                              child: const Text('Resend OTP.'),
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                primary:
                                    Theme.of(context).colorScheme.secondary,
                              ),
                            )
                          : Text('Resend in ${count.toInt()}s');
                    },
                  )
                ],
              ),
              const Text(
                'Enter OTP',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Text(
                'We\'ve sent an OTP to $_contact',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  _inputTextField(first: true, last: false),
                  _inputTextField(first: false, last: false),
                  _inputTextField(first: false, last: false),
                  _inputTextField(first: false, last: false),
                  _inputTextField(first: false, last: false),
                  _inputTextField(first: false, last: true),
                ],
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                child: const Text('Login securely'),
                onPressed: () {
                  Navigator.of(context).pushNamed(PersonalInfoScreen.routeName);
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  primary: const Color(0xffE6A929),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  const Text(
                    'By clicking Login you agree to our',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'terms and conditions',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _inputTextField({required bool first, required bool last}) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      height: 80,
      child: AspectRatio(
        aspectRatio: .5,
        child: TextField(
          // controller: _textController,
          autofocus: true,
          onChanged: (input) {
            if (input.length == 1 && last == false) {
              setState(() {
                _textController.text = _textController.text + input;
              });
              FocusScope.of(context).nextFocus();
              print(_textController.text);
            }
            if (input.isEmpty && first == false) {
              setState(() {
                _textController.text = _textController.text;
              });
              FocusScope.of(context).previousFocus();
              print(_textController.text);
            }
          },
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: const InputDecoration(
            counter: Offstage(),
          ),
        ),
      ),
    );
  }
}
