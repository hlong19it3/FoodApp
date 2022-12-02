// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/providers/auth.provider.dart' as _i3;
import '../../data/repositories/auth.repository.dart' as _i5;
import '../../domain/repositories/auth_repository.dart' as _i4;
import '../../domain/usecases/auth.usecase.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.IAuthProvider>(() => _i3.AuthProvider());
  gh.lazySingleton<_i4.IAuthRepository>(
      () => _i5.AuthRepository(api: get<_i3.IAuthProvider>()));
  gh.lazySingleton<_i6.LoginUseCase>(
      () => _i6.LoginUseCase(get<_i4.IAuthRepository>()));
  gh.lazySingleton<_i6.RegisterUseCase>(
      () => _i6.RegisterUseCase(get<_i4.IAuthRepository>()));
  gh.lazySingleton<_i6.CurrentUserUseCase>(
      () => _i6.CurrentUserUseCase(get<_i4.IAuthRepository>()));
  return get;
}
