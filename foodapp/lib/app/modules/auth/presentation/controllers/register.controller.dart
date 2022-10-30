import 'package:get/get.dart';

import '../../../../core/utils/app_loading.dart';
import 'auth.controller.dart';

class RegisterController extends GetxController {
  final authController = AuthController.to;
  RxBool isShowPwd = false.obs;
  RxBool isShowConfirmPwd = false.obs;

  RxBool isEnabledButton = false.obs;
  RxBool isCheckForm = false.obs;

  void changeShowConfirmPwd() {
    isShowConfirmPwd.value = !isShowConfirmPwd.value;
  }

  void checkForm() {
    // if (user.email.isNotEmpty && user.password.isNotEmpty) {
    //   if (AppValidations.email(user.email, isCheckForm.value) == "" &&
    //       AppValidations.password(user.password, isCheckForm.value) == "") {
    //     isEnabledButton.value = true;
    //   } else {
    //     isEnabledButton.value = false;
    //   }
    // }
    isCheckForm.value = false;
  }

  Future<void> registerWithEmail() async {
    isCheckForm.value = true;
    if (isEnabledButton.value) {
      // AuthService.createUserWithEmailAndPassword(
      //   name.value,
      //   email.value,
      //   password.value,
      // );
    }
  }

  void launchOurTermAndPolicies() async {
    AppLoading.error("Can't lauch Our Term. Please try again.");
  }
}
