import 'package:foodapp/app/core/di/di.dart';
import 'package:foodapp/app/domain/usecases/auth.usecase.dart';
import 'package:get/get.dart';

import '../controllers/login.controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(
      LoginController(
        loginUseCase: getIt.get<LoginUseCase>(),
        // signInWithGoogleUseCase:
        //     SignInWithGoogleUseCase(AuthRepository(api: AuthProvider()))
      ),
    );
  }
}
