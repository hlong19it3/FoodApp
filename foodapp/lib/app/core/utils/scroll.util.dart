import 'dart:async';

import 'package:flutter/cupertino.dart';

class ScrollHelper {
  static void scrollToEnd(ScrollController scrollController) async {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 700),
    );
  }

  static void scrollToPosition(
      ScrollController scrollController, double position) async {
    Timer(
      const Duration(milliseconds: 200),
      () => scrollController.animateTo(
        position,
        curve: Curves.easeOut,
        duration: const Duration(seconds: 500),
      ),
    );
  }
}
