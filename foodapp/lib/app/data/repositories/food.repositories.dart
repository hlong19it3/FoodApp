import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../../domain/entities/food.entity.dart';
import '../../domain/repositories/food.repositories.dart';
import '../providers/food.provider.dart';

@LazySingleton(as: IFoodRepositories)
class FoodRepositories implements IFoodRepositories {
  final IFoodProvider api;
  FoodRepositories({
    required this.api,
  });

  @override
  Future<Either<AppFailure, List<FoodEntity>>> getAll() {
    return api.getAll();
  }

  @override
  Future<Either<AppFailure, List<FoodEntity>>> getPopular(String? value) {
    return api.getPopular(value);
  }

  @override
  Future<Either<AppFailure, List<FoodEntity>>> getTopRated() {
    return api.getTopRated();
  }

  @override
  Future<Either<AppFailure, DetailFoodEntity>> getDetail(int foodId) {
    return api.getDetail(foodId);
  }
}
