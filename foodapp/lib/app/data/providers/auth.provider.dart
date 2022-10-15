import 'package:dartz/dartz.dart';
import 'package:foodapp/app/core/http/helper.dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../../domain/entities/user.entity.dart';

abstract class IAuthProvider {
  Future<Either<AuthFailure, LoginResponseEntity>> login({
    required UserAuthEntity userAuth,
  });
}

@Injectable(as: IAuthProvider)
class AuthProvider implements IAuthProvider {
  @override
  Future<Either<AuthFailure, LoginResponseEntity>> login({
    required UserAuthEntity userAuth,
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
}
