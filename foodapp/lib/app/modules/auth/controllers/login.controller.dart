import 'package:flutter/cupertino.dart';
import 'package:foodapp/app/core/services/stores/box.storage.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/services/stores/secure.storage.dart';
import '../../../core/utils/app_loading.dart';
import '../../../core/utils/app_validations.dart';
import '../../../domain/entities/user.entity.dart';
import '../../../domain/usecases/auth.usecase.dart';
import '../../../routes/app_pages.dart';

enum UserAuthEnum { email, password }

class LoginController extends GetxController {
  LoginUseCase loginUseCase;
  LoginController({
    required this.loginUseCase,
  });

  Rx<UserAuthEntity> userLogin = UserAuthEntity(email: "", password: "").obs;
  TextEditingController emailController = TextEditingController(text: "");
  RxBool isShowPwd = false.obs;
  RxBool isValidForm = false.obs;
  RxBool isCheckForm = false.obs;

  bool get isCheckValid => isCheckForm.value;
  UserAuthEntity get user => userLogin.value;

  @override
  void onInit() {
    getLocalUserData();
    super.onInit();
  }

  void onChangeData(UserAuthEnum userAuthEnum, String data) {
    switch (userAuthEnum) {
      case UserAuthEnum.email:
        userLogin.update((val) {
          val?.email = data;
        });
        break;

      case UserAuthEnum.password:
        userLogin.update((val) {
          val?.password = data;
        });
        break;
    }
    checkForm();
  }

  void checkForm() {
    isCheckForm.value = true;
    if (AppValidations.email(
                email: user.email, isCheckField: isCheckForm.value) ==
            "" &&
        AppValidations.password(user.password, isCheckForm.value) == "") {
      isValidForm.value = true;
    } else {
      isValidForm.value = false;
    }
    isCheckForm.value = false;
  }

  void getLocalUserData() async {
    user.email = emailController.text =
        await SecureStorage.read(key: SecureKey.email) ?? "";
  }

  Future<void> loginWithEmail() async {
    isCheckForm.value = true;
    if (isValidForm.value) {
      AppLoading.loading();
      var reponse = await loginUseCase.call(user);
      reponse.fold(
        (e) =>
            AppLoading.error(e.message ?? LocaleKeys.Auth_Error_LoginFailed.tr),
        (data) async {
          await SecureStorage.write(key: SecureKey.email, value: user.email);
          await KeyStorage.writeString(
              key: KeyKey.token, value: data.accessToken!);
          await KeyStorage.writeString(
              key: KeyKey.refreshToken, value: data.refreshToken!);
          AppLoading.success(LocaleKeys.Auth_Alert_Welcome.tr);

          Get.offAllNamed(Routes.HOME);
        },
      );
    }
  }

  Future<void> signInWithGoogle() async {
    // await signInWithGoogleUseCase.call(NoParams());
  }
}
