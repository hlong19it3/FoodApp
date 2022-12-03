import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/app/core/themes/app_colors.dart';
import 'package:foodapp/app/core/utils/extensions/num.extension.dart';
import 'package:foodapp/app/domain/entities/food.entity.dart';
import 'package:foodapp/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.gen.dart';
import '../../../../core/themes/app_texts.dart';
import '../../../../core/widgets/app_divider.dart';
import '../../../../core/widgets/app_svg_picture.widget.dart';
import '../../../../core/widgets/spacer.dart';

class FoodItemWidget extends StatelessWidget {
  const FoodItemWidget({super.key, required this.food});
  final FoodEntity food;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.FOODDETAIL, arguments: food.id),
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
            const AppDivider(),
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
}
