import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//fontsize
class FontSize {
  static double display = 26.sp;
  static double displaySmall = 22.sp;
  static double headlineLarge = 20.sp;
  static double headline = 18.sp;
  static double body = 16.sp;
  static double bodySmall = 14.sp;
  static double title = 12.sp;
  static double titleSmall = 10.sp;
}

//color
final colorGrey = Colors.grey.shade600;
const colorBlack = Color.fromRGBO(48, 47, 48, 1.0);
const colorWhite = Colors.white;
const backgroundGrey = Color.fromARGB(255, 237, 237, 237);

//space
Widget vertical(double h) {
  return SizedBox(height: h.h);
}
Widget horizontal(double w) {
  return SizedBox(width: w.w);
}

