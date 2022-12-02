import 'package:foodapp/app/domain/usecases/category.usecase.dart';
import 'package:get/get.dart';

import '../../../core/di/di.dart';
import '../../../domain/usecases/auth.usecase.dart';
import '../../../domain/usecases/food.usecase.dart';
import '../controllers/home.controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
        currentUserUseCase: getIt.get<CurrentUserUseCase>(),
        getAllFoodUseCase: getIt.get<GetAllFoodUseCase>(),
        getAllCategoryUseCase: getIt.get<GetAllCategoryUseCase>(),
      ),
      permanent: true,
    );
  }
}
