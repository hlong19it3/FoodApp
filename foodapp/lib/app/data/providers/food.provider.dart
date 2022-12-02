import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../../core/http/helper.dio.dart';
import '../../domain/entities/food.entity.dart';

abstract class IFoodProvider {
  Future<Either<AppFailure, List<FoodEntity>>> getAll();
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
}
