import 'package:dartz/dartz.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../../modules/auth/domain/entity/user.entity.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, LoginResponseEntity>> login({
    required LoginEntity userAuth,
  });
  Future<Either<AuthFailure, bool>> register({
    required RegisterEntity userAuth,
  });
}
