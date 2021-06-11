import 'package:flutter/material.dart';
import 'package:app/ui/intro/onboarding_screen.dart';

class FlashScreen extends StatefulWidget {
  @override
  _FlashScreenState createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.network('https://assets.stickpng.com/images/580b57fcd9996e24bc43c521.png', width: 60, height: 60)));
  }
}
