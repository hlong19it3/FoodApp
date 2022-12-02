import 'package:get/get.dart';

import '../../../../core/utils/app_validations.dart';

class ForgotPasswordController extends GetxController {
  RxString email = "".obs;

  final RxBool _isEnabledButton = false.obs;
  RxBool isCheckForm = false.obs;

  void checkForm() {
    if (email.isNotEmpty) {
      if (AppValidations.email(
              email: email.value, isCheckField: isCheckForm.value) ==
          "") {
        _isEnabledButton.value = true;
      } else {
        _isEnabledButton.value = false;
      }
    }
    isCheckForm.value = false;
  }

  Future<void> forgotPasswordWithEmail() async {
    isCheckForm.value = true;
    if (_isEnabledButton.value) {
      // AuthService.forgotPassword(email.value);
    }
  }
}
