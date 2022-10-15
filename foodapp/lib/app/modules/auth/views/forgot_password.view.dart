import 'package:foodapp/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_validations.dart';
import '../../../core/widgets/appbar_with_icon_back.dart';
import '../../../core/widgets/app_logo.dart';
import '../../../core/widgets/appname.widget.dart';
import '../../../core/widgets/app_input.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/dismis_keyboard.widget.dart';
import '../../../core/widgets/spacer.dart';
import '../controllers/forgot_password.controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const AppBarWithIconBack(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppLogo(
                size: 50,
              ),
              const VSpacer(10),
              const AppName(),
              const VSpacer(5),
              Text(
                LocaleKeys.Auth_ForgotPassword_Des.tr,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
              const VSpacer(30),
              Obx(
                () => AppInput(
                  hintText: "Your Email",
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    controller.email.value = value;
                    controller.checkForm();
                  },
                  prefixIconName: "mail-outline",
                  errorText: AppValidations.email(
                    email: controller.email.value,
                    isCheckField: controller.isCheckForm.value,
                  ),
                  maxLength: 32,
                  inputFormatters: const [],
                ),
              ),
              const VSpacer(10),
              AppButton(
                text: "Send Link Recovery",
                onPress: () {
                  controller.forgotPasswordWithEmail();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
