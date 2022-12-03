import 'package:foodapp/app/core/di/di.dart';
import 'package:foodapp/app/domain/usecases/food.usecase.dart';
import 'package:get/get.dart';

import '../controllers/food_detail.controller.dart';

class FoodDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FoodDetailController>(
      FoodDetailController(
        getDetailFoodUseCase: getIt.get<GetDetailFoodUseCase>(),
      ),
    );
  }
}
