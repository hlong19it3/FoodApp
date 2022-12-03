import 'package:get/get.dart';

import '../../../core/di/di.dart';
import '../../../domain/usecases/food.usecase.dart';
import '../controller/favorite.controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FavoriteController>(
      FavoriteController(
        getPopularFoodUseCase: getIt.get<GetPopularFoodUseCase>(),
      ),
      permanent: true,
    );
  }
}
