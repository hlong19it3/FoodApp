import 'package:flutter/cupertino.dart';
import 'package:foodapp/app/core/services/stores/secure.storage.dart';
import 'package:get/get.dart';

import '../../../../data/datasources/datasource.dart';
import '../../../../domain/entities/onboaring.entity.dart';
import '../../../../routes/app_pages.dart';

class OnBoaringController extends GetxController {
  final List<OnboaringEntity> onBoarings = DataSources.onboarings;

  PageController pageController = PageController(initialPage: 0);

  Rx<int> currentPage = 0.obs;
  bool get isFirstPage => currentPage.value == 0;

  Future<void> onNextPage() async {
    if (currentPage.value == onBoarings.length - 1) {
      await SecureStorage.write(key: SecureKey.isWelcome, value: "false");
      Get.offAndToNamed(Routes.LOGIN);
    } else {
      pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
      );
    }
  }

  Future<void> onPreviousPage() async {
    pageController.previousPage(
      duration: const Duration(seconds: 1),
      curve: Curves.decelerate,
    );
  }
}
