

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/Error/failure.dart';

abstract class BaseUseCase<T,Parameters>{

  Future<Either<Failure,T>>call(Parameters parameters);
}
class NoParameters extends Equatable{
  NoParameters();
  @override
  List<Object?> get props => [];
}