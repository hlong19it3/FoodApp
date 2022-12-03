import 'package:dartz/dartz.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../entities/food.entity.dart';

abstract class IFoodRepositories {
  Future<Either<AppFailure, List<FoodEntity>>> getAll();
  Future<Either<AppFailure, List<FoodEntity>>> getTopRated();
  Future<Either<AppFailure, List<FoodEntity>>> getPopular(String? value);
  Future<Either<AppFailure, DetailFoodEntity>> getDetail(int foodId);
}
