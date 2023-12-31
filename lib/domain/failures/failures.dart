import 'package:equatable/equatable.dart';

abstract class Failures {}

class ServerFailures extends Failures with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class ChacheFailures extends Failures with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class GeneralFailures extends Failures with EquatableMixin {
  @override
  List<Object?> get props => [];
}
