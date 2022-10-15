import 'package:dartz/dartz.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../entities/user.entity.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, LoginResponseEntity>> login({
    required UserAuthEntity userAuth,
  });
}
