import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapp/app/core/themes/app_colors.dart';
import 'package:get/get.dart';

import '../../../../app_responsive.widget.dart';
import '../../../../generated/assets.gen.dart';
import '../../../core/utils/app_validations.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_input.dart';
import '../../../core/widgets/app_logo.dart';
import '../../../core/widgets/app_svg_picture.widget.dart';
import '../../../core/widgets/appbar_with_icon_back.dart';
import '../../../core/widgets/appname.widget.dart';
import '../../../core/widgets/dismis_keyboard.widget.dart';
import '../../../core/widgets/spacer.dart';
import '../controllers/register.controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: GetX<RegisterController>(
        builder: (controller) => AppResponsive(
          mobileScreen: _buildMobileScreen(),
          desktopScreen: _buildDesktopScreen(),
        ),
      ),
    );
  }

  Widget _buildDesktopScreen() {
    return Scaffold(
      appBar: const AppBarWithIconBack(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                AppLogo(
                  size: 50,
                ),
                VSpacer(10),
                AppName(),
                VSpacer(5),
                Text(
                  "Create an account to continue",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    _buildNameField(),
                    const VSpacer(8),
                    _buildEmailField(),
                    const VSpacer(8),
                    _buildPhoneField(),
                    _buildGenderField(),
                    const VSpacer(8),
                    _buildPasswordField(),
                    const VSpacer(8),
                    _buildConfirmPassword(),
                    const VSpacer(8),
                    _buildPolicy(),
                    const VSpacer(8),
                    AppButton(
                      text: "Register",
                      onPress: () {
                        controller.registerWithEmail();
                      },
                    ),
                    const VSpacer(16),
                    _buildTextNavigation(),
                    const VSpacer(20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileScreen() {
    return Scaffold(
      appBar: const AppBarWithIconBack(),
      body: SingleChildScrollView(
        child: Padding(
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
              const Text(
                "Create an account to continue",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              _buildNameField(),
              const VSpacer(8),
              _buildEmailField(),
              const VSpacer(8),
              _buildPhoneField(),
              _buildGenderField(),
              const VSpacer(8),
              _buildPasswordField(),
              const VSpacer(8),
              _buildConfirmPassword(),
              const VSpacer(8),
              _buildPolicy(),
              const VSpacer(8),
              AppButton(
                text: "Register",
                onPress: () {
                  controller.registerWithEmail();
                },
              ),
              const VSpacer(16),
              _buildTextNavigation(),
              const VSpacer(20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderField() {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            title: Text(
              GenderItemsEnum.Male.name,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            leading: Radio(
                value: GenderItemsEnum.Male,
                groupValue: controller.genderItemsEnum,
                onChanged: (GenderItemsEnum? value) =>
                    controller.onChangedGender(value)),
          ),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              GenderItemsEnum.Female.name,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            leading: Radio(
                value: GenderItemsEnum.Female,
                groupValue: controller.genderItemsEnum,
                onChanged: (GenderItemsEnum? value) =>
                    controller.onChangedGender(value)),
          ),
        ),
      ],
    );
  }

  Widget _buildTextNavigation() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account? "),
        InkWell(
          onTap: () => Get.back(),
          child: Text(
            "Login",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColorStyles.blue.shade700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPassword() {
    return AppInput(
      hintText: "Confirm Your Password",
      obscureText: !controller.isShowConfirmPwd.value,
      keyboardType: TextInputType.text,
      onChanged: (value) => controller.onChangedConfirmPassword(value),
      readOnly: controller.isSubmitedForm.value,
      prefixIconName: Assets.icons.shieldOutline,
      errorText: AppValidations.confirmPassword(
        password: controller.user.password,
        confirmPwd: controller.user.confirmPassword,
        isCheckField: controller.isCheckForm.value,
      ),
      suffixIcon: InkWell(
        onTap: () {
          controller.changeShowConfirmPwd();
        },
        customBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 10, 15),
          child: controller.isShowConfirmPwd.value
              ? AppSvgPicture(icon: Assets.icons.eyeOutline)
              : AppSvgPicture(icon: Assets.icons.eyeOffOutline),
        ),
      ),
      maxLength: 32,
      inputFormatters: const [],
    );
  }

  Widget _buildPolicy() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/checkbox.svg",
              height: 20,
              color: Colors.green,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("By creating an account, you agree to "),
          ],
        ),
        InkWell(
          onTap: () => controller.launchOurTermAndPolicies(),
          child: Text(
            "Our terms and policies.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColorStyles.blue.shade700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return AppInput(
      hintText: "Your Password",
      obscureText: !controller.isShowPwd.value,
      keyboardType: TextInputType.text,
      onChanged: (value) => controller.onChangedPassword(value),
      prefixIconName: Assets.icons.lockClosedOutline,
      suffixIcon: InkWell(
        onTap: () => controller.isShowPwd.value = !controller.isShowPwd.value,
        customBorder: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 10, 15),
          child: controller.isShowPwd.value
              ? AppSvgPicture(icon: Assets.icons.eyeOutline)
              : AppSvgPicture(icon: Assets.icons.eyeOffOutline),
        ),
      ),
      maxLength: 32,
      inputFormatters: const [],
      readOnly: controller.isSubmitedForm.value,
      errorText: AppValidations.password(
        password: controller.user.password,
        isCheckField: controller.isCheckForm.value,
      ),
    );
  }

  Widget _buildPhoneField() {
    return AppInput(
      hintText: "Your Phone",
      obscureText: false,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) => controller.onChangedPhone(value),
      errorText: AppValidations.phone(
          phone: controller.user.phone,
          isCheckField: controller.isCheckForm.value),
      prefixIconName: Assets.icons.callOutline,
      maxLength: 32,
      readOnly: controller.isSubmitedForm.value,
    );
  }

  Widget _buildEmailField() {
    return AppInput(
      hintText: "Your Email",
      obscureText: false,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) => controller.onChangedEmail(value),
      errorText: AppValidations.email(
          email: controller.user.email,
          isCheckField: controller.isCheckForm.value),
      prefixIconName: Assets.icons.mailOutline,
      maxLength: 32,
      readOnly: controller.isSubmitedForm.value,
    );
  }

  Row _buildNameField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildFirstNameField()),
        const HSpacer(8),
        Expanded(child: _buildLastNameField()),
      ],
    );
  }

  Widget _buildFirstNameField() {
    return AppInput(
      hintText: "First Name",
      obscureText: false,
      keyboardType: TextInputType.text,
      onChanged: (value) => controller.onChangedFirstName(value),
      prefixIconName: Assets.icons.personOutline,
      errorText: AppValidations.name(
          name: controller.user.firstName,
          isCheckField: controller.isCheckForm.value),
      readOnly: controller.isSubmitedForm.value,
      maxLength: 32,
    );
  }

  Widget _buildLastNameField() {
    return AppInput(
      hintText: "Last Name",
      obscureText: false,
      keyboardType: TextInputType.text,
      onChanged: (value) => controller.onChangedLastName(value),
      prefixIconName: Assets.icons.personOutline,
      errorText: AppValidations.name(
          name: controller.user.lastName,
          isCheckField: controller.isCheckForm.value),
      readOnly: controller.isSubmitedForm.value,
      maxLength: 32,
    );
  }
}
