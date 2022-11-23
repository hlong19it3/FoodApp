import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:window_manager/window_manager.dart';

import 'app/core/constants/breakpoints.dart';
import 'app/core/di/di.dart';
import 'app/core/themes/light_theme.dart';
import 'app/core/utils/app_scrollbehavior.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

Future main() async {
  configureDependencies();
  await GetStorage.init();

  if (Platform.isWindows) configureDIWindows();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

Future<void> configureDIWindows() async {
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: DeviceSize.desktop.size,
    minimumSize: DeviceSize.mobile.size,
    maximumSize: DeviceSize.desktop.maxSize,
    center: true,
    backgroundColor: Colors.transparent,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      scrollBehavior: AppScrollBehavior(),
      unknownRoute: AppPages.routes.last,
      translationsKeys: AppTranslation.translations,
      smartManagement: SmartManagement.keepFactory,
      theme: lightTheme(context),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      initialRoute: AppPages.initial,
      locale: Get.deviceLocale,
      getPages: AppPages.routes,
      navigatorKey: Get.key,
      enableLog: false,
      defaultTransition: Transition.zoom,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
    );
  }
}
