import 'package:tallboyworld/design/AppDesign.dart';
import 'package:tallboyworld/screen/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StateLoginScreen extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppDesign.appBarBackground,
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(),
    );
  }
}
