import 'dart:async';
import 'package:flutter/material.dart';
import 'package:renres_app/Entrance/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => WelcomeScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/renresapp_logo.jpeg',
              width: 300.0,
            ),
            SizedBox(height: 20.0),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
