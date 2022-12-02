import 'package:foodapp/app/domain/usecases/auth.usecase.dart';
import 'package:foodapp/app/domain/entities/user.entity.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/services/stores/secure.storage.dart';
import '../../../core/utils/app_loading.dart';
import '../../../core/utils/app_regexs.dart';
import 'auth.controller.dart';

enum GenderItemsEnum { Male, Female }

class RegisterController extends GetxController {
  RegisterUseCase registerUseCase;
  RegisterController({
    required this.registerUseCase,
  });

  final authController = AuthController.to;
  RxBool isShowPwd = false.obs;
  RxBool isShowConfirmPwd = false.obs;

  RxBool isCheckForm = false.obs;
  RxBool isSubmitedForm = false.obs;
  RxBool isValidForm = false.obs;

  Rx<RegisterEntity> userRegister = RegisterEntity().obs;
  RegisterEntity get user => userRegister.value;

  GenderItemsEnum genderItemsEnum = GenderItemsEnum.Male;

  void changeShowConfirmPwd() {
    isShowConfirmPwd.value = !isShowConfirmPwd.value;
  }

  void checkForm() {
    isCheckForm.value = true;
    if (AppRegexs.email(user.email) && AppRegexs.password(user.password)) {
      isValidForm.value = true;
    } else {
      isValidForm.value = false;
    }
  }

  Future<void> registerWithEmail() async {
    try {
      checkForm();
      if (isValidForm.value && isSubmitedForm.isFalse) {
        isSubmitedForm.value = true;
        AppLoading.loading();
        var reponse = await registerUseCase.call(user);
        reponse.fold(
          (e) {
            throw e;
          },
          (r) async {
            await SecureStorage.write(key: SecureKey.email, value: user.email!);

            AppLoading.success(LocaleKeys.Auth_Alert_SuccessfulRegistration.tr);

            Get.back();
          },
        );
      }
    } catch (e) {
      AppLoading.error("Đăng ký thất bại!");
      isSubmitedForm.value = false;
    }
  }

  void launchOurTermAndPolicies() async {
    AppLoading.error("Can't lauch Our Term. Please try again.");
  }

  void onChangedEmail(String email) {
    userRegister.update((val) {
      val?.email = email;
    });
  }

  void onChangedPassword(String password) {
    userRegister.update((val) {
      val?.password = password;
    });
  }

  void onChangedConfirmPassword(String confirmPassword) {
    userRegister.update((val) {
      val?.confirmPassword = confirmPassword;
    });
  }

  void onChangedFirstName(String firstName) {
    userRegister.update((val) {
      val?.firstName = firstName;
    });
  }

  void onChangedLastName(String lastName) {
    userRegister.update((val) {
      val?.lastName = lastName;
    });
  }

  void onChangedPhone(String phoneNumber) {
    userRegister.update((val) {
      val?.phone = phoneNumber;
    });
  }

  void onChangedGender(GenderItemsEnum? value) {
    genderItemsEnum = value!;
    if (value.name == "Female") {
      userRegister.update((val) {
        val?.gender = 1;
      });
    } else {
      userRegister.update((val) {
        val?.gender = 0;
      });
    }
  }
}
