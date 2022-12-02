import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../../core/domain/usecases/usecase.dart';
import '../entities/category.entity.dart';
import '../repositories/category.repositories.dart';

@lazySingleton
class GetAllCategoryUseCase implements UseCase<void, NoParams> {
  final ICategoryRepositories _categoryRepositories;
  GetAllCategoryUseCase(this._categoryRepositories);

  @override
  Future<Either<AppFailure, List<CategoryEntity>>> call(
      NoParams noParams) async {
    return _categoryRepositories.getAll();
  }
}
