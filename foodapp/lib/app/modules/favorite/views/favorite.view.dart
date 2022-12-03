import 'package:flutter/material.dart';
import 'package:foodapp/app/core/themes/app_texts.dart';
import 'package:foodapp/app/core/widgets/app_input.dart';
import 'package:foodapp/app/modules/favorite/controller/favorite.controller.dart';
import 'package:foodapp/app/modules/home/views/widgets/food_item.widget.dart';
import 'package:foodapp/generated/assets.gen.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<FavoriteController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('Favorite'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              AppInput(
                hintText: "Search foods",
                onChanged: (value) => controller.getPopularFood(value: value),
                prefixIconName: Assets.icons.searchOutline,
              ),
              Expanded(
                child: SmartRefresher(
                  controller: controller.refreshController,
                  onRefresh: () => controller.getPopularFood(),
                  enablePullDown: true,
                  primary: false,
                  enablePullUp: false,
                  physics: const BouncingScrollPhysics(),
                  child: controller.listFood.isEmpty
                      ? Center(
                          child: Text(
                            'Không có data. Vui lòng thử lại sau',
                            style: AppTextStyles.mediumBody1,
                          ),
                        )
                      : ListView.builder(
                          itemCount: controller.listFood.length,
                          shrinkWrap: true,
                          primary: false,
                          
                          itemBuilder: (context, index) => FoodItemWidget(
                            food: controller.listFood[index],
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
