import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../values/color_styles.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    // primaryColorLight: ColorContants.primary,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: ColorStyles.backgrounDeep,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //set as per your  status bar color
        systemNavigationBarColor:
            Colors.transparent, //set as per your navigation bar color
        statusBarIconBrightness:
            Brightness.dark, //set as per your status bar icons' color
        systemNavigationBarIconBrightness: Brightness.dark,
        
      ),
    ),
    primaryColor: ColorStyles.primary,
    scaffoldBackgroundColor: ColorStyles.backgrounDeep,
    colorScheme: const ColorScheme.light(
      primary: Colors.red,
      secondary: ColorStyles.secondary,
      surface: Colors.white,
      // on light theme surface = Colors.white by default
    ),
    backgroundColor: Colors.white,
    // accentColor: Colors.white, => secondary 
    iconTheme: const IconThemeData(color: ColorStyles.bodyText),
    // accentIconTheme: IconThemeData(color:  ColorContants.accentIcon),
    primaryIconTheme: const IconThemeData(color: ColorStyles.primaryIcon),
    // inputDecorationTheme: inputDecorationTheme(context),
    textTheme: GoogleFonts.robotoTextTheme().copyWith(
      bodyText1: const TextStyle(
        color: ColorStyles.titleText,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: const TextStyle(
        color: ColorStyles.titleText,
      ),
      headline4: const TextStyle(
        color: ColorStyles.titleText,
        fontSize: 25,
        fontWeight: FontWeight.w800,
      ),
      headline1: const TextStyle(
        color: ColorStyles.titleText,
        fontSize: 80,
      ),
    ),
  );
}
