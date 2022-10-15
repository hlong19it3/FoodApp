import 'package:get/get.dart';

import '../controllers/onboaring.controller.dart';

class OnBoaringBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OnBoaringController>(
      OnBoaringController(),
    );
  }
}
