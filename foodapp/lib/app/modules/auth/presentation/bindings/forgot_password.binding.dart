import 'package:get/get.dart';

import '../controllers/forgot_password.controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ForgotPasswordController>(
      ForgotPasswordController(),
    );
  }
}
