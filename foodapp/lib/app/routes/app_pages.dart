import 'package:get/get.dart';

import '../modules/auth/bindings/auth.binding.dart';
import '../modules/auth/bindings/forgot_password.binding.dart';
import '../modules/auth/bindings/login.binding.dart';
import '../modules/auth/bindings/onboaring.binding.dart';
import '../modules/auth/bindings/register.binding.dart';
import '../modules/auth/views/auth.view.dart';
import '../modules/auth/views/forgot_password.view.dart';
import '../modules/auth/views/login.view.dart';
import '../modules/auth/views/onboaring.view.dart';
import '../modules/auth/views/register.view.dart';
import '../modules/home/bindings/home.binding.dart';
import '../modules/home/views/home.view.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.AUTH;

  static final routes = [
    GetPage(
      name: Routes.AUTH,
      page: () => const AuthView(),
      bindings: [AuthBinding()],
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => const OnBoaringView(),
      binding: OnBoaringBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    ////////////
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: Routes.NOT_FOUND,
      page: () => const HomeView(),
    ),
  ];
}