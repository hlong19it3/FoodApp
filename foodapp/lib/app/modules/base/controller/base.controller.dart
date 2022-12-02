import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

enum AppTab { HOME, FAVORITE, PROFILE, RECEIPT }

class BaseController extends GetxController {
  static BaseController get to => Get.find();

  final RxInt _currentPage = AppTab.HOME.index.obs;

  int get currentPage => _currentPage.value;
  set currentPage(int value) => _currentPage.value = value;

  PageController pageController =
      PageController(initialPage: AppTab.HOME.index);

  void onPageChanged(int pageIndex) {
    currentPage = pageIndex;
    pageController.jumpToPage(pageIndex);
  }

  void onPageChangedWithAnimation(int pageIndex) {
    currentPage = pageIndex;
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(microseconds: 800),
      curve: Curves.decelerate,
    );
  }
}
