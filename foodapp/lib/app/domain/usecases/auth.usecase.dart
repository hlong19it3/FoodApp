import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/domain/entities/failure.entity.dart';
import '../../core/domain/usecases/usecase.dart';
import '../../modules/auth/domain/entity/user.entity.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class LoginUseCase implements UseCase<void, UserAuthEntity> {
  final IAuthRepository _authRepository;
  LoginUseCase(this._authRepository);

  @override
  Future<Either<AuthFailure, LoginResponseEntity>> call(UserAuthEntity userAuth) async {
    return _authRepository.login(userAuth: userAuth);
  }
}
