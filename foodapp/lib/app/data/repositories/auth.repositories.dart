import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../../domain/entities/user.entity.dart';
import '../../domain/repositories/auth.repositories.dart';
import '../providers/auth.provider.dart';

@LazySingleton(as: IAuthRepositories)
class AuthRepositories implements IAuthRepositories {
  final IAuthProvider api;
  AuthRepositories({
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
