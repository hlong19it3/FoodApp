import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../services/stores/secure.storage.dart';

enum NavigationEnum {
  welcome,
  login,
  home,
  // dynamic
}

abstract class Navigation {
  void navigation();
}

class WelcomeNavigation extends Navigation {
  @override
  void navigation() => Get.offAllNamed(Routes.WELCOME);
}

class LoginNavigation extends Navigation {
  @override
  void navigation() => Get.offAllNamed(Routes.LOGIN);
}

class HomeNavigation extends Navigation {
  @override
  void navigation() => Get.offAllNamed(Routes.HOME);
}

class NavigationFactory {
  Navigation threading(NavigationEnum navigation) {
    switch (navigation) {
      case NavigationEnum.welcome:
        return WelcomeNavigation();
      case NavigationEnum.login:
        return LoginNavigation();
      case NavigationEnum.home:
        return HomeNavigation();
    }
  }
}

class AuthNavigation {
  AuthNavigation({
    required NavigationFactory navigationFactory,
  }) : _navigationFactory = navigationFactory;

  final NavigationFactory _navigationFactory;

  Future<void> direction() async {
    NavigationEnum authNavigation = await _initData();
    Navigation navigation = _navigationFactory.threading(authNavigation);
    navigation.navigation();
  }

  Future<NavigationEnum> _initData() async {
    if (await SecureStorage.read(key: SecureKey.isWelcome) == null) {
      return NavigationEnum.welcome;
    } else if (await SecureStorage.read(key: SecureKey.email) == null ||
        await SecureStorage.read(key: SecureKey.token) == null) {
      return NavigationEnum.login;
    }
    return NavigationEnum.home;
  }
}
