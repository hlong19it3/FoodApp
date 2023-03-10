import 'package:foodapp/app/core/services/stores/box.storage.dart';
import 'package:foodapp/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../core/auth/auth_navigation.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  AuthController({
    required this.authNavigation,
  });
  AuthNavigation authNavigation;

  @override
  void onInit() {
    super.onInit();
    authNavigation.direction();
  }

  Future<void> logout() async {
    await KeyStorage.delete(key: KeyKey.token);
    Get.offAndToNamed(Routes.LOGIN);
  }
}
