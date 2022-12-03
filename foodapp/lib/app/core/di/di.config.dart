// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/providers/auth.provider.dart' as _i3;
import '../../data/providers/category.provider.dart' as _i6;
import '../../data/providers/food.provider.dart' as _i9;
import '../../data/repositories/auth.repositories.dart' as _i5;
import '../../data/repositories/category.repositories.dart' as _i8;
import '../../data/repositories/food.repositories.dart' as _i11;
import '../../domain/repositories/auth.repositories.dart' as _i4;
import '../../domain/repositories/category.repositories.dart' as _i7;
import '../../domain/repositories/food.repositories.dart' as _i10;
import '../../domain/usecases/auth.usecase.dart' as _i12;
import '../../domain/usecases/category.usecase.dart' as _i13;
import '../../domain/usecases/food.usecase.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i4.IAuthRepositories>(
      () => _i5.AuthRepositories(api: get<_i3.IAuthProvider>()));
  gh.factory<_i6.ICategoryProvider>(() => _i6.FoodProvider());
  gh.lazySingleton<_i7.ICategoryRepositories>(
      () => _i8.CategoryRepositories(api: get<_i6.ICategoryProvider>()));
  gh.factory<_i9.IFoodProvider>(() => _i9.FoodProvider());
  gh.lazySingleton<_i10.IFoodRepositories>(
      () => _i11.FoodRepositories(api: get<_i9.IFoodProvider>()));
  gh.lazySingleton<_i12.LoginUseCase>(
      () => _i12.LoginUseCase(get<_i4.IAuthRepositories>()));
  gh.lazySingleton<_i12.RegisterUseCase>(
      () => _i12.RegisterUseCase(get<_i4.IAuthRepositories>()));
  gh.lazySingleton<_i12.CurrentUserUseCase>(
      () => _i12.CurrentUserUseCase(get<_i4.IAuthRepositories>()));
  gh.lazySingleton<_i13.GetAllCategoryUseCase>(
      () => _i13.GetAllCategoryUseCase(get<_i7.ICategoryRepositories>()));
  gh.lazySingleton<_i14.GetAllFoodUseCase>(
      () => _i14.GetAllFoodUseCase(get<_i10.IFoodRepositories>()));
  gh.lazySingleton<_i14.GetDetailFoodUseCase>(
      () => _i14.GetDetailFoodUseCase(get<_i10.IFoodRepositories>()));
  gh.lazySingleton<_i14.GetPopularFoodUseCase>(
      () => _i14.GetPopularFoodUseCase(get<_i10.IFoodRepositories>()));
  gh.lazySingleton<_i14.GetTopRatedFoodUseCase>(
      () => _i14.GetTopRatedFoodUseCase(get<_i10.IFoodRepositories>()));
  return get;
}
