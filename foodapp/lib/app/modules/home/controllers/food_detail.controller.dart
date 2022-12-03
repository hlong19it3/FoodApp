import 'dart:developer';

import 'package:foodapp/app/domain/entities/food.entity.dart';
import 'package:foodapp/app/domain/usecases/food.usecase.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FoodDetailController extends GetxController {
  final GetDetailFoodUseCase getDetailFoodUseCase;
  FoodDetailController({required this.getDetailFoodUseCase});

  late int foodId;
  final Rx<DetailFoodEntity> _food = DetailFoodEntity().obs;
  DetailFoodEntity get food => _food.value;

  FoodEntity get foodDetail => food.food!;
  String? get categoryName => food.categoryName;

  final RxBool _hasData = false.obs;
  bool get hasData => _hasData.value;

  RefreshController refreshController = RefreshController();
  
  @override
  Future<void> onInit() async {
    foodId = Get.arguments;
    await getAllCategories();
    super.onInit();
  }

  Future<void> onRefresh() async {
    await getAllCategories();
    refreshController.refreshCompleted();
  }
  Future<void> getAllCategories() async {
    try {
      final res = await getDetailFoodUseCase.call(foodId);
      res.fold((l) {
        throw Exception();
      }, (r) {
        _food.value = r;
        _hasData.value = true;
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
