import 'package:get/get.dart';

import '../controller/base.controller.dart';


class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BaseController>(
      BaseController(),
      permanent: true,
    );
  }
}
