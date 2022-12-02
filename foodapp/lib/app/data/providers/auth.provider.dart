import 'package:dartz/dartz.dart';
import 'package:foodapp/app/core/http/helper.dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../../modules/auth/domain/entity/user.entity.dart';

abstract class IAuthProvider {
  Future<Either<AuthFailure, LoginResponseEntity>> login({
    required LoginEntity userAuth,
  });
  Future<Either<AuthFailure, bool>> register({
    required RegisterEntity userAuth,
  });

  Future<Either<AuthFailure, CurrentUserEntity>> currentUser();
}

@Injectable(as: IAuthProvider)
class AuthProvider implements IAuthProvider {
  @override
  Future<Either<AuthFailure, LoginResponseEntity>> login({
    required LoginEntity userAuth,
  }) async {
    try {
      HttpResponse res = await HttpHelper.post(
        "auth/login",
        data: userAuth.toJson(),
      );
      return Right(LoginResponseEntity.fromJson(res.body));
    } catch (e) {
      return Left(AuthFailure(code: "100"));
    }
  }

  @override
  Future<Either<AuthFailure, bool>> register({
    required RegisterEntity userAuth,
  }) async {
    try {
      await HttpHelper.post(
        "signup",
        data: userAuth.toJson(),
      );
      return const Right(true);
    } catch (e) {
      return Left(AuthFailure(code: "100"));
    }
  }

  @override
  Future<Either<AuthFailure, CurrentUserEntity>> currentUser() async {
    try {
      final res = await HttpHelper.get("auth/current-user");
      return Right(CurrentUserEntity.fromJson(res.body));
    } catch (e) {
      return Left(AuthFailure(code: "100"));
    }
  }
}
