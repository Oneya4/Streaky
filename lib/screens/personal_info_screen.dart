import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

class PersonalInfoScreen extends StatefulWidget {
  static const routeName = 'personal-info';

  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _pageContorller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageContorller,
          physics: const BouncingScrollPhysics(),
          children: [
            OnboardingDesign(
              heading: 'What is your\nname?',
              detailText: 'Enter your full name',
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  hintText: 'John Doe',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              buttonText: 'Continue',
              onbuttonPressed: () {
                _pageContorller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInToLinear,
                );
              },
            ),
            OnboardingDesign(
              heading: 'When is your\nbirthday?',
              detailText: 'Enter your date of birth',
              child: TextFormField(
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  hintText: 'dd/mm/yyyy',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              buttonText: 'Continue',
              onbuttonPressed: () {
                _pageContorller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInToLinear,
                );
              },
            ),
            OnboardingDesign(
              heading: 'What are your\npreparing for?',
              detailText: 'Select your class',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      selectStd(std[0], 0),
                      selectStd(std[1], 1),
                      selectStd(std[2], 2),
                      selectStd(std[3], 3),
                      selectStd(std[4], 4),
                      selectStd(std[5], 5),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Select your exam',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    children: [
                      selectExam(exam[0], 0),
                      selectExam(exam[1], 1),
                    ],
                  ),
                ],
              ),
              buttonText: 'Let\'s get started',
              onbuttonPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  List<String> std = [
    '8th Std',
    '9th Std',
    '10th Std',
    '11th Std',
    '12th Std',
    '12+'
  ];

  List<String> exam = ['JEE', 'NEET'];

  int _selectedStd = 0;
  int _selectedExam = 0;

  _changeStd(int index) {
    setState(() {
      _selectedStd = index;
    });
  }

  _changeExam(int index) {
    setState(() {
      _selectedExam = index;
    });
  }

  Widget selectStd(String text, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: OutlinedButton(
        child: Text(text),
        onPressed: () => _changeStd(index),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shape: const StadiumBorder(),
          primary: _selectedStd == index
              ? Colors.white
              : Theme.of(context).colorScheme.secondary,
          backgroundColor: _selectedStd == index
              ? Theme.of(context).colorScheme.secondary
              : Colors.transparent,
          side: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }

  Widget selectExam(String text, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: OutlinedButton(
        child: Text(text),
        onPressed: () => _changeExam(index),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shape: const StadiumBorder(),
          primary: _selectedExam == index
              ? Colors.white
              : Theme.of(context).colorScheme.secondary,
          backgroundColor: _selectedExam == index
              ? Theme.of(context).colorScheme.secondary
              : Colors.transparent,
          side: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
