// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum _TextProp { b1, b1Medium, b2, b2Medium, b3, b3Medium, mainTemp, h1, h2 }

class AppText extends StatelessWidget {
  final String text;
  late TextStyle style;
  late _TextProp textProp;
  double? fontSize;

  Color? color = Colors.black;

  AppText.h1(this.text, {super.key, this.color}) {
    textProp = _TextProp.h1;
  }

  AppText.h2(this.text, {super.key, this.color}) {
    textProp = _TextProp.h2;
  }

  AppText.b1(this.text, {super.key, this.color}) {
    textProp = _TextProp.b1;
  }

  AppText.b1Medium(this.text, {super.key, this.color}) {
    textProp = _TextProp.b1Medium;
  }

  AppText.b2(this.text, {super.key, this.color}) {
    textProp = _TextProp.b2;
  }

  AppText.b2Medium(this.text, {super.key, this.color}) {
    textProp = _TextProp.b2Medium;
  }

  AppText.b3(this.text, {super.key, this.color}) {
    textProp = _TextProp.b3;
  }

  AppText.b3Medium(this.text, {super.key, this.color}) {
    textProp = _TextProp.b3Medium;
  }

  AppText.custom(this.text, {super.key, this.color, this.fontSize}) {
    textProp = _TextProp.mainTemp;
  }

  TextStyle? getStyle(BuildContext context, _TextProp textProp) {
    switch (textProp) {
      case _TextProp.b1:
        return GoogleFonts.roboto(fontSize: 17, color: color);
      case _TextProp.b1Medium:
        return GoogleFonts.roboto(
            fontSize: 17, fontWeight: FontWeight.w500, color: color);
      case _TextProp.b2:
        return GoogleFonts.roboto(fontSize: 15, color: color);
      case _TextProp.b2Medium:
        return GoogleFonts.roboto(
            fontSize: 15, fontWeight: FontWeight.w500, color: color);
      case _TextProp.b3:
        return GoogleFonts.roboto(fontSize: 13, color: color);
      case _TextProp.b3Medium:
        return GoogleFonts.roboto(
            fontSize: 13, fontWeight: FontWeight.w500, color: color);
      case _TextProp.mainTemp:
        return GoogleFonts.ubuntu(
            fontSize: 64, fontWeight: FontWeight.w500, color: color);
      case _TextProp.h1:
        return GoogleFonts.ubuntu(
            fontSize: 28, fontWeight: FontWeight.w500, color: color);
      case _TextProp.h2:
        return GoogleFonts.ubuntu(
            fontSize: 20, fontWeight: FontWeight.w500, color: color);
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(this.text,
        overflow: TextOverflow.clip, style: getStyle(context, textProp));
  }
}
