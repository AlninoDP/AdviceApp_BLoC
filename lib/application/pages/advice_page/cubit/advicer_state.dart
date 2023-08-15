part of 'advicer_cubit.dart';

sealed class AdvicerState extends Equatable {
  const AdvicerState();

  @override
  List<Object> get props => [];
}

final class AdvicerInitial extends AdvicerState {}

final class AdvicerStateLoading extends AdvicerState {}

final class AdvicerStateLoaded extends AdvicerState {}

final class AdvicerStateError extends AdvicerState {}
