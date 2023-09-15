import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppLayout {
  static const double standardHeight = 852;
  static const double standardWidth = 393;

  static getSize(BuildContext context) {
    return MediaQuery
        .of(context)
        .size;
  }

  static getScreenHeight() {
    return Get.height;
  }

  static getScreenWidth() {
    return Get.width;
  }

  static getHeight(double height) {
    double ratio = standardHeight / height;
    return getScreenHeight() / ratio;
  }

  static getWidth(double width) {
    double ratio = standardWidth / width;
    return getScreenWidth() / ratio;
  }
}