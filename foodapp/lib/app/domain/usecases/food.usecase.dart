import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../../core/domain/usecases/usecase.dart';
import '../entities/food.entity.dart';
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
