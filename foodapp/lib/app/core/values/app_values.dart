import 'dart:ui';

import 'package:flutter/material.dart';

class AppValues {
  static double get statusBarHeight =>
      MediaQueryData.fromWindow(window).padding.top;
}
