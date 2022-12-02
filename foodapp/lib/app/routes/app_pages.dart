import 'package:foodapp/app/modules/base/bindings/base.binding.dart';
import 'package:foodapp/app/modules/base/views/base.view.dart';
import 'package:get/get.dart';

import '../modules/auth/bindings/auth.binding.dart';
import '../modules/auth/bindings/onboaring.binding.dart';
import '../modules/auth/views/auth.view.dart';
import '../modules/auth/views/login.view.dart';
import '../modules/auth/views/onboaring.view.dart';
import '../modules/auth/views/register.view.dart';
import '../modules/home/bindings/home.binding.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.AUTH;

  static final routes = [
    GetPage(
      name: Routes.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => const OnBoaringView(),
      binding: OnBoaringBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.BASE,
      page: () => const BaseView(),
      bindings: [
        BaseBinding(),
        HomeBinding(),
      ],
    ),
  ];
}
