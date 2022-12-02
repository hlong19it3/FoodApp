import 'dart:developer';

import 'package:foodapp/app/core/domain/usecases/usecase.dart';
import 'package:foodapp/app/domain/entities/category.entity.dart';
import 'package:foodapp/app/domain/entities/food.entity.dart';
import 'package:foodapp/app/domain/usecases/auth.usecase.dart';
import 'package:foodapp/app/domain/entities/user.entity.dart';
import 'package:foodapp/app/domain/usecases/category.usecase.dart';
import 'package:foodapp/app/domain/usecases/food.usecase.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final CurrentUserUseCase currentUserUseCase;
  final GetAllFoodUseCase getAllFoodUseCase;
  final GetAllCategoryUseCase getAllCategoryUseCase;
  HomeController({
    required this.currentUserUseCase,
    required this.getAllFoodUseCase,
    required this.getAllCategoryUseCase,
  });

  final Rx<CurrentUserEntity> _currentUser = CurrentUserEntity().obs;
  CurrentUserEntity get currentUser => _currentUser.value;

  String? get lastName => currentUser.lastName;
  String? get avatar => currentUser.avatar;
  String? get email => currentUser.email;

  final RxList<FoodEntity> _listFood = <FoodEntity>[].obs;
  List<FoodEntity> get listFood => _listFood;

  final RxList<CategoryEntity> _categories = <CategoryEntity>[].obs;
  List<CategoryEntity> get categories => _categories;

  @override
  Future<void> onInit() async {
    await getCurrentUser();
    await getAllCategories();
    await getAllFoods();
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

  Future<void> getAllFoods() async {
    try {
      final res = await getAllFoodUseCase.call(NoParams());
      res.fold((l) {
        throw Exception();
      }, (r) => _listFood.value = r);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getAllCategories() async {
    try {
      final res = await getAllCategoryUseCase.call(NoParams());
      res.fold((l) {
        throw Exception();
      }, (r) => _categories.value = r);
    } catch (e) {
      log(e.toString());
    }
  }
}
