import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapp/app/core/widgets/dismis_keyboard.widget.dart';
import 'package:foodapp/app/core/widgets/spacer.dart';
import 'package:get/get.dart';

import '../../../../core/values/color_styles.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_input.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/appbar_with_icon_back.dart';
import '../../../../core/widgets/appname.widget.dart';
import '../controllers/register.controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: GetX<RegisterController>(
        builder: (controller) => Scaffold(
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
                  AppInput(
                    hintText: "Your Name",
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      controller.checkForm();
                    },
                    prefixIconName: "person-outline",
                    maxLength: 32,
                  ),
                  const VSpacer(10),

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
                    ),
                  ),
                  const VSpacer(10),
                  // Obx(
                  //   () => AppInput(
                  //     hintText: "Your Password",
                  //     obscureText: !controller.isShowPwd.value,
                  //     keyboardType: TextInputType.text,
                  //     onChanged: (value) {
                  //       controller.checkForm();
                  //     },
                  //     prefixIconName: "lock-closed-outline",
                  //     suffixIcon: InkWell(
                  //       onTap: () => controller.isShowPwd.value =
                  //           !controller.isShowPwd.value,
                  //       customBorder: const RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.only(
                  //           topRight: Radius.circular(15),
                  //           bottomRight: Radius.circular(15),
                  //         ),
                  //       ),
                  //       child: Padding(
                  //         padding: const EdgeInsets.fromLTRB(15, 15, 10, 15),
                  //         child: controller.isShowPwd.value
                  //             ? AppSvgPicture(icon: Assets.icons.eyeOutline)
                  //             : AppSvgPicture(icon: Assets.icons.eyeOffOutline),
                  //       ),
                  //     ),
                  //     maxLength: 32,
                  //     inputFormatters: const [],
                  //   ),
                  // ),
                  const VSpacer(10),
                  // Obx(
                  //   () => AppInput(
                  //     hintText: "Confirm Your Password",
                  //     obscureText: !controller.isShowConfirmPwd.value,
                  //     keyboardType: TextInputType.text,
                  //     onChanged: (value) {
                  //       controller.checkForm();
                  //     },
                  //     prefixIconName: "shield-outline",
                  //     suffixIcon: InkWell(
                  //       onTap: () {
                  //         controller.changeShowConfirmPwd();
                  //       },
                  //       customBorder: const RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.only(
                  //           topRight: Radius.circular(15),
                  //           bottomRight: Radius.circular(15),
                  //         ),
                  //       ),
                  //       child: Padding(
                  //         padding: const EdgeInsets.fromLTRB(15, 15, 10, 15),
                  //         child: controller.isShowConfirmPwd.value
                  //             ? AppSvgPicture(icon: Assets.icons.eyeOutline)
                  //             : AppSvgPicture(icon: Assets.icons.eyeOffOutline),
                  //       ),
                  //     ),
                  //     maxLength: 32,
                  //     inputFormatters: const [],
                  //   ),
                  // ),
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
      ),
    );
  }
}
