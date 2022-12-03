import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../../core/domain/usecases/usecase.dart';
import '../entities/food.entity.dart';
import '../entities/user.entity.dart';
import '../repositories/food.repositories.dart';

@lazySingleton
class GetAllFoodUseCase implements UseCase<void, NoParams> {
  final IFoodRepositories _foodRepositories;
  GetAllFoodUseCase(this._foodRepositories);

  @override
  Future<Either<AppFailure, List<FoodEntity>>> call(NoParams noParams) async {
    return _foodRepositories.getAll();
  }
}

@lazySingleton
class GetTopRatedFoodUseCase implements UseCase<void, NoParams> {
  final IFoodRepositories _foodRepositories;
  GetTopRatedFoodUseCase(this._foodRepositories);

  @override
  Future<Either<AppFailure, List<FoodEntity>>> call(NoParams noParams) async {
    return _foodRepositories.getTopRated();
  }
}


@lazySingleton
class GetPopularFoodUseCase implements UseCase<void, String?> {
  final IFoodRepositories _foodRepositories;
  GetPopularFoodUseCase(this._foodRepositories);

  @override
  Future<Either<AppFailure, List<FoodEntity>>> call(String? value) async {
    return _foodRepositories.getPopular(value);
  }
}

@lazySingleton
class GetDetailFoodUseCase implements UseCase<void, int> {
  final IFoodRepositories _foodRepositories;
  GetDetailFoodUseCase(this._foodRepositories);

  @override
  Future<Either<AppFailure, DetailFoodEntity>> call(int foodId) async {
    return _foodRepositories.getDetail(foodId);
  }
}
