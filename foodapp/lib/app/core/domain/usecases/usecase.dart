import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entities/failure.entity.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppFailure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
