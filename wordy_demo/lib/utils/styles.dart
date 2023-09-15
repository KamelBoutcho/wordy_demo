import 'dart:ffi';

import 'package:flutter/material.dart';

import 'my_layout.dart';


Color primary = const Color(0xFF687daf);

class Styles {

  static Color primaryColor = primary;
  static Color textColor = const Color(0xFF3b3b3b);
  static Color bgColor = const Color(0xFFeeedf2);
  static Color orangeColor = const Color(0xFFF37B67);
  static Color kakiColor = const Color(0xFFd2bdb6);
  static TextStyle textStyle = TextStyle(
    fontSize: AppLayout.getWidth(16), color: textColor,
    fontWeight: FontWeight.w500,);
  static TextStyle headlineStyle1 = TextStyle(
    fontSize: AppLayout.getWidth(26), color: textColor,
    fontWeight: FontWeight.bold,);
  static TextStyle headlineStyle2 = TextStyle(
    fontSize: AppLayout.getWidth(21), color: textColor,
    fontWeight: FontWeight.bold,);
  static TextStyle headlineStyle3 = TextStyle(
    fontSize: AppLayout.getWidth(17), color: Colors.grey.shade500,
    fontWeight: FontWeight.w500,);
  static TextStyle headlineStyle4 = TextStyle(
    fontSize: AppLayout.getWidth(14), color: Colors.grey.shade500,
    fontWeight: FontWeight.w500,);

}
//colors for my theme
Map<String,int> myColors = {
  "Rich black":0xFF03071e,
  "Chocolate cosmos":0xFF370617,
  "Rosewood":0xFF6a040f,
  "Penn red":0xFF9d0208,
  "Engineering orange":0xFFd00000,
  "Sinopia":0xFFdc2f02,
  "Persimmon":0xFFe85d04,
  "Princeton orange":0xFFf48c06,
  "Orange (web)":0xFFfaa307,
  "Selective yellow":0xFFffba08
};