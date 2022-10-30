import 'package:get/get.dart';

import '../../../../core/auth/auth_navigation.dart';
import '../controllers/auth.controller.dart';

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
  }
}
