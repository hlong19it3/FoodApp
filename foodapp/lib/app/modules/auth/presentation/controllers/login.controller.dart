import 'package:flutter/cupertino.dart';
import 'package:foodapp/app/core/services/stores/box.storage.dart';
import 'package:foodapp/app/core/utils/app_regexs.dart';
import 'package:get/get.dart';

import '../../../../../generated/locales.g.dart';
import '../../../../core/services/stores/secure.storage.dart';
import '../../../../core/utils/app_loading.dart';
import '../../domain/entity/user.entity.dart';
import '../../../../domain/usecases/auth.usecase.dart';
import '../../../../routes/app_pages.dart';

enum UserAuthEnum { email, password }

class LoginController extends GetxController {
  LoginUseCase loginUseCase;
  LoginController({
    required this.loginUseCase,
  });

  Rx<LoginEntity> userLogin = LoginEntity(email: "", password: "").obs;
  TextEditingController emailController = TextEditingController(text: "");
  RxBool isShowPwd = false.obs;
  RxBool isValidForm = false.obs;
  RxBool isCheckForm = false.obs;
  RxBool isSubmitedForm = false.obs;

  bool get isCheckValid => isCheckForm.value;
  LoginEntity get user => userLogin.value;

  void onChangeData(UserAuthEnum userAuthEnum, String data) {
    isCheckForm.value = false;
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
  }

  void checkForm() {
    isCheckForm.value = true;
    if (AppRegexs.email(user.email) && AppRegexs.password(user.password)) {
      isValidForm.value = true;
    } else {
      isValidForm.value = false;
    }
  }

  Future<void> loginWithEmail() async {
    try {
      checkForm();
      if (isValidForm.value && isSubmitedForm.isFalse) {
        isSubmitedForm.value = true;
        AppLoading.loading();
        var reponse = await loginUseCase.call(user);
        reponse.fold(
          (e) {
            throw e;
          },
          (data) async {
            await SecureStorage.write(key: SecureKey.email, value: user.email);
            await KeyStorage.writeString(
                key: KeyKey.token, value: data.tokens.accessToken!);
            await KeyStorage.writeString(
                key: KeyKey.refreshToken, value: data.tokens.refreshToken!);
            AppLoading.success(LocaleKeys.Auth_Alert_Welcome.tr);

            Get.offAllNamed(Routes.HOME);
          },
        );
      }
    } catch (e) {
      AppLoading.error(LocaleKeys.Auth_Error_LoginFailed.tr);
      isSubmitedForm.value = false;
    }
  }
}
