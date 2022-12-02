import 'package:dartz/dartz.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../entities/food.entity.dart';

abstract class IFoodRepositories {
  Future<Either<AppFailure, List<FoodEntity>>> getAll();
}
