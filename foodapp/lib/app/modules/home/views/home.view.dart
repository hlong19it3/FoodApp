import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/app/modules/home/views/widgets/food_item.widget.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.gen.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/app_texts.dart';
import '../../../core/utils/extensions/string.extentions.dart';
import '../../../core/widgets/app_icon_button.widget.dart';
import '../../../core/widgets/app_input.dart';
import '../../../core/widgets/spacer.dart';
import '../../../domain/entities/category.entity.dart';
import '../../auth/controllers/auth.controller.dart';
import '../../base/controller/base.controller.dart';
import '../controllers/home.controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
              onPress: () => AuthController.to.logout(),
              icon: Assets.icons.logOutOutline,
            ),
          ],
        ),
        body: SizedBox(
          height: double.infinity,
          child: _buildMobile(),
        ),
      ),
    );
  }

  Widget _buildMobile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () => controller.getData(),
        enablePullDown: true,
        primary: false,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Delicious", style: AppTextStyles.mobileSubtitle),
            Text("food for you", style: AppTextStyles.mobileSubtitle),
            const VSpacer(8),
            Text("Welcome ${controller.currentUser.lastName}!",
                style: AppTextStyles.mobileSubtitle1),
            const VSpacer(16),
            AppInput(
              hintText: "Search",
              readOnly: true,
              onTap: () =>
                  BaseController.to.onPageChanged(AppTab.FAVORITE.index),
              onChanged: (value) {},
              prefixIconName: Assets.icons.searchOutline,
            ),
            const VSpacer(16),
            _buildTitle(
              count: controller.categories.length,
              name: "Categories",
            ),
            const VSpacer(16),
            _buildCategories(),
            const VSpacer(16),
            _buildTitle(
              count: controller.listTopRatedFood.length,
              name: "Top foods",
            ),
            const VSpacer(16),
            _buildPopularFoods(),
            const VSpacer(16),
            _buildTitle(
              count: controller.listFood.length,
              name: "All food",
            ),
            const VSpacer(16),
            _buildAllFoods(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle({required String name, required int count}) {
    return Row(
      children: [
        Text(name, style: AppTextStyles.mobileSubtitle1),
        const HSpacer(4),
        Text("($count)",
            style: AppTextStyles.mobileSubtitle2
                .copyWith(color: AppColorStyles.orange.shade500)),
      ],
    );
  }

  Widget _buildPopularFoods() {
    return ListView.builder(
      itemCount: controller.listTopRatedFood.length,
      shrinkWrap: true,
      primary: false,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return FoodItemWidget(food: controller.listTopRatedFood[index]);
      },
    );
  }

  Widget _buildAllFoods() {
    return ListView.builder(
      itemCount: controller.listFood.length,
      shrinkWrap: true,
      primary: false,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return FoodItemWidget(food: controller.listFood[index]);
      },
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        shrinkWrap: true,
        primary: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final category = controller.categories[index];
          return _buildCategoryItem(category);
        },
      ),
    );
  }

  Widget _buildCategoryItem(CategoryEntity category) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColorStyles.black.shade100,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: CachedNetworkImage(
                width: 150,
                height: 100,
                fit: BoxFit.cover,
                imageUrl: category.image!,
              ),
            ),
            const Spacer(),
            Text(
              category.name!.capitalizeFirst!,
              style: AppTextStyles.mobileSubtitle1,
            ),
            const VSpacer(8),
          ],
        ),
      ),
    );
  }
}
