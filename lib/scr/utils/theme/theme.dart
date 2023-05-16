import 'package:flutter/material.dart';
import 'package:shubhithasenergysolutions/scr/constants/colors.dart';
import 'package:shubhithasenergysolutions/scr/utils/theme/widget_theme/elevated_button_theme.dart';
import 'package:shubhithasenergysolutions/scr/utils/theme/widget_theme/outlined_button_theme.dart';
import 'package:shubhithasenergysolutions/scr/utils/theme/widget_theme/text_field_theme.dart';
import 'package:shubhithasenergysolutions/scr/utils/theme/widget_theme/text_theme.dart';

class KspAppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: KTextTheme.lightTextTheme,
    primaryColor: tPrimaryColor,
    primaryColorLight: tPrimaryColorLight,
    
    // accentColor: tAccentColor,
    // scaffoldBackgroundColor: tDarkColor,
    outlinedButtonTheme: KOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: KelevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: KTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: KTextTheme.darkTextTheme,
    primaryColor: tDarkColor,
    // accentColor: tAccentColor,
    outlinedButtonTheme: KOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: KelevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: KTextFormFieldTheme.darkInputDecorationTheme,
  );
}
