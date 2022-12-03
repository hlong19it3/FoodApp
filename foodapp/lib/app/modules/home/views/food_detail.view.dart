import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/app/core/themes/app_colors.dart';
import 'package:foodapp/app/core/themes/app_texts.dart';
import 'package:foodapp/app/core/utils/extensions/num.extension.dart';
import 'package:foodapp/app/core/widgets/app_icon_button.widget.dart';
import 'package:foodapp/app/core/widgets/spacer.dart';
import 'package:foodapp/app/modules/home/controllers/food_detail.controller.dart';
import 'package:foodapp/generated/assets.gen.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/widgets/app_svg_picture.widget.dart';

class FoodDetailView extends GetView<FoodDetailController> {
  const FoodDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<FoodDetailController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(),
        body: controller.hasData
            ? SmartRefresher(
                controller: controller.refreshController,
                onRefresh: () => controller.onRefresh(),
                enablePullDown: true,
                primary: false,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildImage(),
                      const VSpacer(16),
                      _buildCategoryName(),
                      const VSpacer(16),
                      _buildFoodName(),
                      _buildFoodPrice(),
                      const VSpacer(16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: AppColorStyles.black.shade100,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColorStyles.black3,
                          ),
                        ),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                AppSvgPicture(
                                  icon: Assets.icons.star,
                                  color: AppColorStyles.yellow.shade500,
                                ),
                                const HSpacer(16),
                                Text(
                                  controller.foodDetail.rating!
                                      .toStringAsFixed(1),
                                  style: AppTextStyles.mobileSubtitle2.copyWith(
                                    color: AppColorStyles.black10,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            const HSpacer(8),
                            Text(
                              "(${controller.foodDetail.totalRating ?? 0} ratings)",
                              style: AppTextStyles.mobileSubtitle2.copyWith(
                                color: AppColorStyles.orange.shade500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const VSpacer(24),
                      Text(
                        controller.foodDetail.details!,
                        style: AppTextStyles.mobileBody.copyWith(
                          color: AppColorStyles.black7,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
      ),
    );
  }

  Row _buildFoodPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${controller.foodDetail.price!.formatCurrentUnit()} đ",
          style: AppTextStyles.mobileSubtitle1.copyWith(
            color: AppColorStyles.black10,
          ),
        ),
        const HSpacer(8),
        AppIconButton(
          onPress: () {},
          icon: Assets.icons.bagAddOutline,
        ),
      ],
    );
  }

  Text _buildFoodName() {
    return Text(
      controller.foodDetail.name!.capitalizeFirst!,
      style: AppTextStyles.mobileSubtitle1.copyWith(
        color: AppColorStyles.black10,
      ),
    );
  }

  Text _buildCategoryName() {
    return Text(
      controller.categoryName!.toUpperCase(),
      style: AppTextStyles.mobileSubtitle0.copyWith(
        color: AppColorStyles.orange.shade500,
      ),
    );
  }

  ClipRRect _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
        imageUrl: controller.foodDetail.image!,
      ),
    );
  }
}
