import 'package:flutter/material.dart';
import 'package:foodapp/app/core/themes/app_colors.dart';

OutlineInputBorder focusedOutlineInputBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(color: AppColorStyles.black10),
    borderRadius: BorderRadius.circular(10),
    gapPadding: 5,
  );
}

OutlineInputBorder outlineInputBorder(context) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: AppColorStyles.black10),
    gapPadding: 0,
  );
}
