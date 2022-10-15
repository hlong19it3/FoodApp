import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.gen.dart';
import '../../../core/values/color_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_input.dart';
import '../../../core/widgets/app_logo.dart';
import '../../../core/widgets/app_svg_picture.widget.dart';
import '../../../core/widgets/appbar_with_icon_back.dart';
import '../../../core/widgets/appname.widget.dart';
import '../../../core/widgets/outline_icon_button.widget.dart';
import '../../../core/widgets/strike_thorough.widget.dart';
import '../controllers/register.controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        // resizeToAvoidBottomInset: true,
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
                const SizedBox(
                  height: 10,
                ),
               const AppName(),
                const SizedBox(
                  height: 5,
                ),
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
                Obx(
                  () => AppInput(
                    hintText: "Your Name",
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      controller.checkForm();
                    },
                    prefixIconName: "person-outline",
                   
                    maxLength: 32,
                    inputFormatters: const [],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => AppInput(
                    hintText: "Your Email",
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      controller.checkForm();
                    },
                    prefixIconName: "mail-outline",
                  
                    maxLength: 32,
                    inputFormatters: const [],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => AppInput(
                    hintText: "Your Password",
                    obscureText: !controller.isShowPwd.value,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      controller.checkForm();
                    },
                    prefixIconName: "lock-closed-outline",
               
                    suffixIcon: InkWell(
                      onTap: () => controller.isShowPwd.value =
                          !controller.isShowPwd.value,
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
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => AppInput(
                    hintText: "Confirm Your Password",
                    obscureText: !controller.isShowConfirmPwd.value,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      controller.checkForm();
                    },
                    prefixIconName: "shield-outline",
                  
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
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
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
                      child: const Text(
                        "Our terms and policies.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorStyles.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                AppButton(
                  text: "Register",
                  onPress: () {
                    controller.registerWithEmail();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const StrikeThrough(width: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "or".toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5,
                          ),
                        ),
                      ),
                      const StrikeThrough(width: 20),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlineIconButton(
                        icon: "google",
                        name: "Google",
                        onPress: () {},
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: OutlineIconButton(
                        icon: "apple",
                        name: "Apple",
                        onPress: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    InkWell(
                      onTap: () => Get.back(),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorStyles.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
