part of 'advicer_cubit.dart';

sealed class AdvicerState extends Equatable {
  const AdvicerState();

  @override
  List<Object?> get props => [];
}

final class AdvicerInitial extends AdvicerState {}

final class AdvicerStateLoading extends AdvicerState {}

final class AdvicerStateLoaded extends AdvicerState {
  final String advice;
  const AdvicerStateLoaded({required this.advice});
  @override
  List<Object?> get props => [advice];
}

final class AdvicerStateError extends AdvicerState {
  final String errorMsg;
  const AdvicerStateError({required this.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}
