import 'package:get/get.dart';

class BaseController extends GetxController {
  static BaseController get to => Get.find();

  // final List<String> _pages = [
  //   Routes.HOME,
  //   Routes.EXPLORE,
  //   Routes.FAVOURITES,
  //   Routes.PROFILE,
  // ];

  // RxString _language = "".obs;
  // RxString _currentPage = Routes.HOME.obs;

  // String get currentLanguage => _language.value;

  // int get currentPageIndex => _pages.indexWhere((_) => _ == _currentPage.value);

  // @override
  // void onInit() {
  //   _setInitialLocalLanguage();
  //   super.onInit();
  // }

  // _setInitialLocalLanguage() {
  //   String? locate = _store.read<String?>(AppStorageKey.LANGUAGE);
  //   if (locate == '' || locate == null) {
  //     locate = Get.deviceLocale!.languageCode;
  //   }
  //   updateLanguage(locate);
  // }

  // Locale get getLocale {
  //   if (currentLanguage == '') {
  //     _language.value = AppConfig.DEFAULT_LANGUAGE;
  //     updateLanguage(AppConfig.DEFAULT_LANGUAGE);
  //   }
  //   final Locale locale =
  //       SUPPORTED_LOCALES.firstWhere((l) => l.languageCode == currentLanguage);
  //   return locale;
  // }

  // Future<void> updateLanguage(String value) async {
  //   _language.value = value;
  //   await _store.write(AppStorageKey.LANGUAGE, value);
  //   Get.updateLocale(getLocale);
  //   update();
  // }

  // void onCurrentTabChanged(int tabIndex) {
  //   final String selectedPage = _pages[tabIndex];
  //   //
  //   _currentPage.value = selectedPage;
  //   //
  //   Get.offAllNamed(selectedPage);
  // }
}
