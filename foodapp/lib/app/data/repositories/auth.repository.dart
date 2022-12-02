import 'package:dartz/dartz.dart';
import 'package:foodapp/app/core/domain/entities/failure.entity.dart';
import 'package:foodapp/app/modules/auth/domain/entity/user.entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/auth_repository.dart';
import '../providers/auth.provider.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  final IAuthProvider api;
  AuthRepository({
    required this.api,
  });

  @override
  Future<Either<AuthFailure, LoginResponseEntity>> login(
      {required LoginEntity userAuth}) {
    return api.login(userAuth: userAuth);
  }

  @override
  Future<Either<AuthFailure, bool>> register(
      {required RegisterEntity userAuth}) {
    return api.register(userAuth: userAuth);
  }

  @override
  Future<Either<AuthFailure, CurrentUserEntity>> currentUser() {
    return api.currentUser();
  }
}
