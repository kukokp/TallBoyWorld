import 'dart:async';
import 'package:flutter/material.dart';
import 'MainCategory.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TollBoyWorld',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    Timer(Duration(seconds: 2), () async {
      //   if (await EcommerceApp.auth.currentUser != null) {
      Route newRoute = MaterialPageRoute(builder: (_) => MainCategory());
      Navigator.pushReplacement(context, newRoute);
      //   } else {
      //     /// Not SignedIn
      //     Route newRoute = MaterialPageRoute(builder: (_) => AuthenticScreen());
      //     Navigator.pushReplacement(context, newRoute);
      //   }
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
              Image.asset('images/welcome.png'),
              Text('Welcome to TallBoyWorld'),
              Text('Date:11/10/2020'),
            ],
          ),
        ),
      ),
    );
  }
}
