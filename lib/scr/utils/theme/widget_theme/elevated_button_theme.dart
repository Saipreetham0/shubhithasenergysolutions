import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions/scr/constants/colors.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';

class KelevatedButtonTheme {
  KelevatedButtonTheme._();

  // light color theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        foregroundColor: tWhiteColor,
        backgroundColor: tSecondaryColor,
        side: const BorderSide(color: tSecondaryColor),
        padding: const  EdgeInsets.symmetric(vertical: tButtonHeight)),
  );

  // dark color theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        foregroundColor: tSecondaryColor,
        backgroundColor: tWhiteColor,
        side: const  BorderSide(color: tSecondaryColor),
        padding: const  EdgeInsets.symmetric(vertical: tButtonHeight)),
  );
}
