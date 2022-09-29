import 'package:fitness/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_onboarding_screen/OnbordingData.dart';
import '../onboarding/onboarding.dart';
import '../login/LoginScreen.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final List<OnbordingData> list = [
    OnbordingData(
      imagePath: "assets/images/one.jpg",
      title: "Train",
      desc: "The more you sweat in training, the less you bleed in combat",
    ),
    OnbordingData(
      imagePath: "assets/images/two.jpg",
      title: "Everything",
      desc: "Everything is hard before it is easy.",
    ),
    OnbordingData(
      imagePath: "assets/images/three.jpg",
      title: "Want Something",
      desc: "If you want something you’ve never had, you must be willing to do something you’ve never done.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroScreen(
          list, MaterialPageRoute(builder: (context) =>  LoginScreen())),
    );
  }
}
