
import 'package:bookforme/introscreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      centered: true,
      splash: const Text("Book For Me", style: TextStyle(color: Colors.black, fontSize: 40, fontFamily: "IrishGrover"),),
      nextScreen: const IntroScreen(),
      duration: 5000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}