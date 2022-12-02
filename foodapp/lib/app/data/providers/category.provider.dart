import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../../core/http/helper.dio.dart';
import '../../domain/entities/category.entity.dart';

abstract class ICategoryProvider {
  Future<Either<AppFailure, List<CategoryEntity>>> getAll();
}

@Injectable(as: ICategoryProvider)
class FoodProvider implements ICategoryProvider {
  String defaultAPI = "category";
  @override
  Future<Either<AppFailure, List<CategoryEntity>>> getAll() async {
    try {
      final res = await HttpHelper.get("$defaultAPI/all");
      final data = res.body
          .map<CategoryEntity>((e) => CategoryEntity.fromJson(e))
          .toList();
      return Right(data);
    } catch (e) {
      return Left(AppFailure());
    }
  }
}
