import 'dart:developer';

import 'package:foodapp/app/domain/usecases/food.usecase.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/domain/usecases/usecase.dart';
import '../../../domain/entities/food.entity.dart';

class FavoriteController extends GetxController {
  final GetPopularFoodUseCase getPopularFoodUseCase;
  FavoriteController({required this.getPopularFoodUseCase});

  final RxList<FoodEntity> _listFood = <FoodEntity>[].obs;
  List<FoodEntity> get listFood => _listFood;

  RefreshController refreshController = RefreshController();

  @override
  Future<void> onInit() async {
    await getPopularFood();
    super.onInit();
  }

  Future<void> getPopularFood({String? value}) async {
    try {
      final res = await getPopularFoodUseCase.call(value);
      res.fold((l) {
        throw Exception();
      }, (r) {
        _listFood.value = r;
        refreshController.refreshCompleted();
      });
    } catch (e) {
      log(e.toString());
      refreshController.refreshFailed();
    }
  }
}
