import 'package:get/get.dart';

import '../../../../core/auth/auth_navigation.dart';
import '../../../../core/di/di.dart';
import '../../../../domain/usecases/auth.usecase.dart';
import '../controllers/auth.controller.dart';
import '../controllers/forgot_password.controller.dart';
import '../controllers/login.controller.dart';
import '../controllers/register.controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(
      AuthController(
        authNavigation: AuthNavigation(
          navigationFactory: NavigationFactory(),
        ),
      ),
      permanent: true,
    );
    Get.lazyPut<LoginController>(
      () => LoginController(
        loginUseCase: getIt.get<LoginUseCase>(),
      ),
    );
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(),
    );
  }
}
