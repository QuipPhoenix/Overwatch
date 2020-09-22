import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'welcome-screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      imageBackground: AssetImage('assets/load_screen.jpg'),
      seconds: 3,
      navigateAfterSeconds: WelcomeScreen(),
      loaderColor: Colors.teal,
      backgroundColor: Colors.white,
    );
  }
}
