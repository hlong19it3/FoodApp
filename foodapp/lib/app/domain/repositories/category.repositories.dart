import 'package:dartz/dartz.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../entities/category.entity.dart';

abstract class ICategoryRepositories {
  Future<Either<AppFailure, List<CategoryEntity>>> getAll();
}
