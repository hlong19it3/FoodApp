import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppLoading {
  static dismiss() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => EasyLoading.dismiss(animation: true),
    );
  }

  static loading() {
    return EasyLoading.show(status: "Loading...", dismissOnTap: false);
  }

  static success(String status) async {
    await EasyLoading.showSuccess(
      status,
      dismissOnTap: true,
      duration: const Duration(
        seconds: 1,
      ),
    );
  }

  static error(String status) {
    return EasyLoading.showError(
      status,
      dismissOnTap: true,
      duration: const Duration(
        seconds: 2,
      ),
    );
  }
}
