import 'dart:async';

import 'package:tallboyworld/screen/CategoryScreen.dart';
import 'package:tallboyworld/screen/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StateSplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  void startTime() {
    Timer(Duration(seconds: 2), () async {
      //GeneralUtils.showToast("Splash Screen Done",AppConstant.Toast_Bottom,AppConstant.Toast_Info);
      // Route newRoute = MaterialPageRoute(builder: (_) => LoginScreen(title: 'LoginScreen'));
      Route newRoute =
          MaterialPageRoute(builder: (_) => CategoryScreen(title: 'Category'));
      Navigator.pushReplacement(context, newRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/splash_logo.png'),
              Text('TaraPaint Production'),
              Text('Date:11/10/2020'),
            ],
          ),
        ),
      ),
    );
  }
}
