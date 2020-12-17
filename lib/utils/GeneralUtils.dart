import 'package:tallboyworld/utils/AppConstant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GeneralUtils {
  static void showToast(String msg, int gravity, int color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: getToastGravity(gravity),
        timeInSecForIosWeb: 1,
        backgroundColor: getToastColors(color),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static ToastGravity getToastGravity(int gravity) {
    ToastGravity rtn;
    rtn = ToastGravity.TOP;
    if (gravity == AppConstant.toastCenter) {
      rtn = ToastGravity.CENTER;
    } else if (gravity == AppConstant.toastBottom) {
      rtn = ToastGravity.BOTTOM;
    }
    return rtn;
  }

  static Color getToastColors(int colors) {
    Color rtn;
    rtn = Colors.red;
    if (colors == AppConstant.toastInfo) {
      rtn = Colors.grey;
    } else if (colors == AppConstant.toastWarning) {
      rtn = Colors.yellowAccent;
    }
    return rtn;
  }
}
