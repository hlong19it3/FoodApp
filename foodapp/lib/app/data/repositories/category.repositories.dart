import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../../domain/entities/category.entity.dart';
import '../../domain/repositories/category.repositories.dart';
import '../providers/category.provider.dart';

@LazySingleton(as: ICategoryRepositories)
class CategoryRepositories implements ICategoryRepositories {
  final ICategoryProvider api;
  CategoryRepositories({
    required this.api,
  });

  @override
  Future<Either<AppFailure, List<CategoryEntity>>> getAll() {
    return api.getAll();
  }
}
