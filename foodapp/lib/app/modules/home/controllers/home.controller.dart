import 'dart:developer';

import 'package:foodapp/app/core/domain/usecases/usecase.dart';
import 'package:foodapp/app/domain/usecases/auth.usecase.dart';
import 'package:foodapp/app/modules/auth/domain/entity/user.entity.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final CurrentUserUseCase currentUserUseCase;
  HomeController({required this.currentUserUseCase});

  final Rx<CurrentUserEntity> _currentUser = CurrentUserEntity().obs;
  CurrentUserEntity get currentUser => _currentUser.value;

  String? get lastName => currentUser.lastName;
  String? get avatar => currentUser.avatar;
  String? get email => currentUser.email;
  @override
  Future<void> onInit() async {
    await getCurrentUser();
    super.onInit();
  }

  Future<void> getCurrentUser() async {
    try {
      final res = await currentUserUseCase.call(NoParams());
      res.fold((l) {
        throw Exception();
      }, (r) => _currentUser.value = r);
    } catch (e) {
      log(e.toString());
    }
  }
}
