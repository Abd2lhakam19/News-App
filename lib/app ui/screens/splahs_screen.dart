import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/app%20ui/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      Duration(seconds:2 ), () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.asset("assets/images/splash.png"),
      ),
    );
  }
}
