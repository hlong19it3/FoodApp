import 'package:dartz/dartz.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../entities/user.entity.dart';

abstract class IAuthRepositories {
  Future<Either<AuthFailure, LoginResponseEntity>> login({
    required LoginEntity userAuth,
  });
  Future<Either<AuthFailure, bool>> register({
    required RegisterEntity userAuth,
  });

  Future<Either<AuthFailure, CurrentUserEntity>> currentUser();
}
