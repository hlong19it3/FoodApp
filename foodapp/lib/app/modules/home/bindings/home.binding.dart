import 'package:get/get.dart';

import '../../../core/di/di.dart';
import '../../../domain/usecases/auth.usecase.dart';
import '../controllers/home.controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
        currentUserUseCase: getIt.get<CurrentUserUseCase>(),
      ),
      permanent: true,
    );
  }
}
