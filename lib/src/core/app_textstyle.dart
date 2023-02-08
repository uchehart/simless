import 'package:flutter/material.dart';
import 'package:simless/src/core/responsiveness.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTextStyles {
  static TextStyle bigHeader(BuildContext context, {Color? color}) =>
      GoogleFonts.mulish(
        fontWeight: FontWeight.w800,
        color: color ?? AppColors.black,
        fontSize: 59.32,
        //height: 7.09,
      );
  static TextStyle gradient({required Color color1, color2}) => TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      foreground: Paint()
        ..shader = LinearGradient(
          // begin: Alignment.centerRight,
          // end: Alignment.bottomRight,
          colors: <Color>[
            // Color(0xFF26CFAD),
            // Color(0xFF2196F3),
            color1,
            color2
          ],
        ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 100.0)));

  static TextStyle heading1(BuildContext context, {Color? color}) =>
      GoogleFonts.mulish(
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.black,
        fontSize: responsive26(context),
      );

  static TextStyle heading2(BuildContext context, {Color? color}) =>
      GoogleFonts.mulish(
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.black,
        fontSize: responsive20(context),
      );

  static TextStyle heading3(BuildContext context, {Color? color}) =>
      GoogleFonts.mulish(
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.black,
        fontSize: responsive18(context),
      );

  static TextStyle subtitle(BuildContext context, {Color? color}) =>
      GoogleFonts.mulish(
        fontWeight: FontWeight.w700,
        color: color ?? AppColors.black,
        fontSize: responsive16(context),
      );

  static TextStyle smallSubtitle(BuildContext context, {Color? color}) =>
      GoogleFonts.mulish(
        fontWeight: FontWeight.w300,
        color: color ?? AppColors.black,
        fontSize: responsive12(context),
      );

  static TextStyle smallText(BuildContext context, {Color? color}) =>
      GoogleFonts.mulish(
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.black,
        fontSize: responsive12(context),
      );
}
