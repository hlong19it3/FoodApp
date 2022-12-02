import 'package:foodapp/app/core/themes/app_colors.dart';
import 'package:foodapp/app_responsive.widget.dart';
import 'package:foodapp/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../generated/locales.g.dart';
import '../../../../core/utils/app_validations.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_input.dart';
import '../../../../core/widgets/app_input_icon.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/appname.widget.dart';
import '../../../../core/widgets/dismis_keyboard.widget.dart';
import '../../../../core/widgets/spacer.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/login.controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: GetX<LoginController>(
        builder: (controller) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: AppResponsive(
              mobileScreen: _buildMobile(),
              desktopScreen: _buildDesktop(),
            )),
      ),
    );
  }

  Widget _buildDesktop() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              AppLogo(
                size: 50,
              ),
              VSpacer(10),
              Text(
                "Welcome to",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              VSpacer(10),
              AppName(),
            ],
          ),
        ),
        const HSpacer(100),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildEmailField(),
              const VSpacer(10),
              _buildPasswordField(),
              const VSpacer(5),
              _buildTextNavigation(),
              const VSpacer(20),
              _buildLoginButton(),
            ],
          ),
        )
      ]),
    );
  }

  Widget _buildEmailField() {
    return AppInput(
      hintText: "Email Address",
      keyboardType: TextInputType.emailAddress,
      controller: controller.emailController,
      onChanged: (value) => controller.onChangeData(UserAuthEnum.email, value),
      prefixIconName: Assets.icons.mailOutline,
      errorText: AppValidations.email(
        email: controller.user.email,
        isCheckField: controller.isCheckValid,
      ),
      readOnly: controller.isSubmitedForm.value,
      maxLength: 32,
    );
  }

  Widget _buildMobile() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VSpacer(50),
          const AppLogo(
            size: 50,
          ),
          const VSpacer(8),
          const Text(
            "Welcome to",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          const VSpacer(10),
          const AppName(),
          const VSpacer(50),
          _buildEmailField(),
          const VSpacer(8),
          _buildPasswordField(),
          const VSpacer(4),
          _buildTextNavigation(),
          const VSpacer(16),
          _buildLoginButton(),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return AppButton(
      text: LocaleKeys.Auth_Login.tr,
      onPress: () => controller.loginWithEmail(),
    );
  }

  Widget _buildTextNavigation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LocaleKeys.Auth_ForgotPassword_Name.tr,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          InkWell(
            onTap: () => Get.toNamed(Routes.REGISTER),
            child: Text(
              LocaleKeys.Auth_Register.tr,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColorStyles.blue.shade700,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPasswordField() {
    return AppInput(
      hintText: "Your Password",
      obscureText: !controller.isShowPwd.value,
      keyboardType: TextInputType.text,
      onChanged: (value) =>
          controller.onChangeData(UserAuthEnum.password, value),
      errorText: AppValidations.password(
        password: controller.user.password,
        isCheckField: controller.isCheckValid,
      ),
      readOnly: controller.isSubmitedForm.value,
      prefixIconName: Assets.icons.lockClosedOutline,
      suffixIcon: InkWell(
        onTap: () => controller.isShowPwd.value = !controller.isShowPwd.value,
        customBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: controller.isShowPwd.value
            ? AppInputIcon(icon: Assets.icons.eyeOutline, isPrefix: false)
            : AppInputIcon(icon: Assets.icons.eyeOffOutline, isPrefix: false),
      ),
    );
  }
}
