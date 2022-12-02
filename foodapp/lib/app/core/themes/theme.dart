import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_texts.dart';
import 'constants.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData.light().copyWith(
      brightness: Brightness.light,
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(
        primary: AppColorStyles.blue,
        secondary: AppColorStyles.blue.shade900,
        error: AppColorStyles.red.shade400,
        brightness: Brightness.light,
      ),
      canvasColor: Colors.white,
      iconTheme: IconThemeData(color: AppColorStyles.black.shade700, size: 20),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        iconTheme:
            IconThemeData(color: AppColorStyles.black.shade700, size: 20),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        shadowColor: AppColorStyles.black.shade200.withOpacity(.3),
        titleTextStyle: AppTextStyles.mobileSubtitle1
            .copyWith(color: AppColorStyles.black10),
      ),
      textTheme: GoogleFonts.interTextTheme(
        Theme.of(context).textTheme.apply(fontSizeFactor: 1),
      ));
}
