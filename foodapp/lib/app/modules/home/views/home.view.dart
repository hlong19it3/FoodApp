import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/app/core/utils/extensions/num.extension.dart';
import 'package:foodapp/app/core/widgets/app_svg_picture.widget.dart';
import 'package:foodapp/app/domain/entities/food.entity.dart';
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
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
                  const VSpacer(16),
                  Text("Categories", style: AppTextStyles.mobileSubtitle1),
                  const VSpacer(16),
                  _buildCategories(),
                  const VSpacer(16),
                  Text("All products", style: AppTextStyles.mobileSubtitle1),
                  const VSpacer(16),
                  _buildProducts(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProducts() {
    return ListView.builder(
      itemCount: controller.listFood.length,
      shrinkWrap: true,
      primary: false,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final food = controller.listFood[index];
        return _buildProductItem(food);
      },
    );
  }

  Widget _buildProductItem(FoodEntity food) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColorStyles.black.shade100,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRightProductItem(food),
            _buildLeftProductItem(food),
          ],
        ),
      ),
    );
  }

  Widget _buildLeftProductItem(FoodEntity food) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              food.name!.capitalizeFirst!,
              style: AppTextStyles.mobileSubtitle1.copyWith(
                color: AppColorStyles.black9,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const VSpacer(8),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColorStyles.black.shade100,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColorStyles.black3,
                    ),
                  ),
                  child: Row(
                    children: [
                      AppSvgPicture(
                        icon: Assets.icons.star,
                        color: AppColorStyles.yellow.shade500,
                        size: 12,
                      ),
                      const HSpacer(4),
                      Text(
                        food.rating!.toStringAsFixed(1),
                        style: AppTextStyles.mobileOverLine.copyWith(
                          color: AppColorStyles.black10,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const HSpacer(8),
                Text(
                  "${food.totalRating ?? 0} ratings",
                  style: AppTextStyles.mobileSmall.copyWith(
                    color: AppColorStyles.orange.shade500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const VSpacer(8),
            Text(
              "${food.price!.formatCurrentUnit()} đ",
              style: AppTextStyles.mobileSubtitle2.copyWith(
                color: AppColorStyles.black10,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const VSpacer(4),
            Container(
              height: 2,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColorStyles.black.shade300,
              ),
            ),
            const VSpacer(4),
            Text(
              food.details.toString(),
              style: AppTextStyles.mobileSuperSmall.copyWith(
                color: AppColorStyles.black7,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRightProductItem(FoodEntity food) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        width: 120,
        height: 150,
        fit: BoxFit.cover,
        imageUrl: food.image!,
      ),
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
