import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions/scr/constants/colors.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';

class KOutlinedButtonTheme {
  KOutlinedButtonTheme._();

  // light color theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        foregroundColor: tSecondaryColor,
        side: const  BorderSide(color: tSecondaryColor),
        shape: const  RoundedRectangleBorder(),
        padding: const EdgeInsets.symmetric(vertical: tButtonHeight)),
  );

  // dark color theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        foregroundColor: tWhiteColor,
        side: const BorderSide(color: tWhiteColor),
        shape: const RoundedRectangleBorder(),
        padding: const EdgeInsets.symmetric(vertical: tButtonHeight)),
  );
}
