import 'package:flutter/material.dart';
import 'package:foodapp/app/core/widgets/icon_bottom_bar.widget.dart';
import 'package:foodapp/app/modules/favorite/views/favorite.view.dart';
import 'package:foodapp/app/modules/home/views/home.view.dart';
import 'package:foodapp/app/modules/profile/views/profile.view.dart';
import 'package:foodapp/app/modules/receipt/views/receipt.view.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.gen.dart';
import '../controller/base.controller.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<BaseController>(
      builder: (controller) => Scaffold(
        body: PageView.builder(
          physics: const BouncingScrollPhysics(),
          onPageChanged: (value) =>
              controller.onPageChangedWithAnimation(value),
          controller: controller.pageController,
          pageSnapping: true,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return const HomeView();
              case 1:
                return const FavoriteView();
              case 2:
                return const ProfileView();

              case 3:
                return const ReceiptView();
            }
            return null;
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                icon: Assets.icons.homeOutline,
                onTap: () => controller.onPageChanged(AppTab.HOME.index),
                isCurrentPage: AppTab.HOME.index == controller.currentPage,
              ),
              IconBottomBar(
                icon: Assets.icons.heartOutline,
                onTap: () => controller.onPageChanged(AppTab.FAVORITE.index),
                isCurrentPage: AppTab.FAVORITE.index == controller.currentPage,
              ),
              IconBottomBar(
                icon: Assets.icons.personOutline,
                onTap: () => controller.onPageChanged(AppTab.PROFILE.index),
                isCurrentPage: AppTab.PROFILE.index == controller.currentPage,
              ),
              IconBottomBar(
                icon: Assets.icons.receiptOutline,
                onTap: () => controller.onPageChanged(AppTab.RECEIPT.index),
                isCurrentPage: AppTab.RECEIPT.index == controller.currentPage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
