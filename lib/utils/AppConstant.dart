import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConstant {
  //Toast : Type
  static int toastError = 1;
  static int toastWarning = 2;
  static int toastInfo = 3;

  //Toast : Gravity
  static int toastTop = 1;
  static int toastCenter = 2;
  static int toastBottom = 3;

  static TextStyle fontTitleStyle = new TextStyle(
    fontStyle: FontStyle.normal,
    color: Colors.black,
    fontSize: 17.0,
  );
  static TextStyle fontSubTitleStyle = new TextStyle(
    fontStyle: FontStyle.normal,
    color: Colors.blueGrey,
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );
}
