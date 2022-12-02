import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/app/core/themes/app_texts.dart';
import 'package:foodapp/app/core/utils/extensions/string.extentions.dart';
import 'package:foodapp/app/core/widgets/app_input.dart';
import 'package:foodapp/app/core/widgets/app_icon_button.widget.dart';
import 'package:foodapp/app/core/widgets/spacer.dart';
import 'package:foodapp/app/modules/auth/presentation/controllers/auth.controller.dart';
import 'package:foodapp/generated/assets.gen.dart';
import 'package:get/get.dart';

import '../controllers/home.controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: controller.avatar.isAvailable
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      height: 36,
                      fit: BoxFit.cover,
                      imageUrl: controller.avatar!,
                    ),
                  ),
                )
              : null,
          actions: [
            AppIconButton(
              onPress: () {},
              icon: Assets.icons.bagOutline,
            ),
            AppIconButton(
              onPress: () => AuthController.to.logout(),
              icon: Assets.icons.logOutOutline,
            ),
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Delicious", style: AppTextStyles.mobileSubtitle),
                Text("food for you", style: AppTextStyles.mobileSubtitle),
                const VSpacer(8),
                Text("Welcome ${controller.currentUser.lastName}!",
                    style: AppTextStyles.mobileSubtitle1),
                const VSpacer(16),
                AppInput(
                  hintText: "Search",
                  onChanged: (value) {},
                  prefixIconName: Assets.icons.searchOutline,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
