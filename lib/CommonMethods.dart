import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
class CM {
  static String cover;
  static String name;
  static String imgpath;
  static String title;
  static String pages;
  static String size;
  static String pdf;
  static String intro;
static String transparentImg;

  static void showToast(BuildContext context,Text)
  {
    Toast.show(
        Text,

        context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM,backgroundColor:Colors.red);
  }



}