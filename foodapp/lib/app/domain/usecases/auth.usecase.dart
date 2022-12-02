import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../../core/domain/usecases/usecase.dart';
import '../entities/user.entity.dart';
import '../repositories/auth.repositories.dart';

@lazySingleton
class LoginUseCase implements UseCase<void, LoginEntity> {
  final IAuthRepositories _authRepository;
  LoginUseCase(this._authRepository);

  @override
  Future<Either<AuthFailure, LoginResponseEntity>> call(
      LoginEntity userAuth) async {
    return _authRepository.login(userAuth: userAuth);
  }
}

@lazySingleton
class RegisterUseCase implements UseCase<void, RegisterEntity> {
  final IAuthRepositories _authRepository;
  RegisterUseCase(this._authRepository);

  @override
  Future<Either<AuthFailure, bool>> call(RegisterEntity userAuth) async {
    return _authRepository.register(userAuth: userAuth);
  }
}

@lazySingleton
class CurrentUserUseCase implements UseCase<void, NoParams> {
  final IAuthRepositories _authRepository;
  CurrentUserUseCase(this._authRepository);

  @override
  Future<Either<AuthFailure, CurrentUserEntity>> call(NoParams noParams) async {
    return _authRepository.currentUser();
  }
}
