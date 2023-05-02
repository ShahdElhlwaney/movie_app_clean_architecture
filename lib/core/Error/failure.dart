


import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{

  final String message;

  Failure(this.message);

}
class ServerFailure extends Failure{
  ServerFailure(super.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];

}
class DatabaseFailure extends Failure{
  DatabaseFailure(super.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];

}