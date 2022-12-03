import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../../core/http/helper.dio.dart';
import '../../domain/entities/food.entity.dart';

abstract class IFoodProvider {
  Future<Either<AppFailure, List<FoodEntity>>> getAll();
  Future<Either<AppFailure, List<FoodEntity>>> getPopular(String? value);
  Future<Either<AppFailure, List<FoodEntity>>> getTopRated();
  Future<Either<AppFailure, DetailFoodEntity>> getDetail(int foodId);
}

@Injectable(as: IFoodProvider)
class FoodProvider implements IFoodProvider {
  String defaultAPI = "food";
  @override
  Future<Either<AppFailure, List<FoodEntity>>> getAll() async {
    try {
      final res = await HttpHelper.get("$defaultAPI/all");
      final data =
          res.body.map<FoodEntity>((e) => FoodEntity.fromJson(e)).toList();
      return Right(data);
    } catch (e) {
      return Left(AppFailure());
    }
  }

  @override
  Future<Either<AppFailure, List<FoodEntity>>> getPopular(String? value) async {
    try {
      final res = await HttpHelper.getRecommend("$defaultAPI/popular?searchTerm=$value");
      final data =
          res.body.map<FoodEntity>((e) => FoodEntity.fromJson(e)).toList();
      return Right(data);
    } catch (e) {
      return Left(AppFailure());
    }
  }

  @override
  Future<Either<AppFailure, List<FoodEntity>>> getTopRated() async {
    try {
      final res = await HttpHelper.getRecommend("$defaultAPI/toprated");
      final data =
          res.body.map<FoodEntity>((e) => FoodEntity.fromJson(e)).toList();
      return Right(data);
    } catch (e) {
      return Left(AppFailure());
    }
  }

  @override
  Future<Either<AppFailure, DetailFoodEntity>> getDetail(int foodId) async {
    try {
      final res = await HttpHelper.get("$defaultAPI/select-by-id?id=$foodId");

      return Right(DetailFoodEntity.fromJson(res.body));
    } catch (e) {
      return Left(AppFailure());
    }
  }
}
