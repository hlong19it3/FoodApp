import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color_styles.dart';

class AppColors {
  static Color get primary => Theme.of(Get.context!).primaryColor;
  static Color get background => Theme.of(Get.context!).backgroundColor;

  static Color get text => Theme.of(Get.context!).textTheme.bodyText1!.color!;
  static Color get iconColor => Theme.of(Get.context!).iconTheme.color!;
  static Color get error => ColorStyles.error;
}
