import 'package:flutter/material.dart';

import '../../values/app_colors.dart';

OutlineInputBorder focusedOutlineInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.iconColor),
    borderRadius: BorderRadius.circular(10),
    gapPadding: 5,
  );
}

OutlineInputBorder outlineInputBorder(context) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: AppColors.iconColor),
    gapPadding: 0,
  );
}
