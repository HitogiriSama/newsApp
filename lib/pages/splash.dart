import 'package:flutter/material.dart';

import '../home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateHome();
    super.initState();
  }

  _navigateHome() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      'assets/222.png',
      fit: BoxFit.cover,
    ));
  }
}
