import 'package:adviceapp/domain/failures/failures.dart';
import 'package:adviceapp/domain/usecases/advice_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'advicer_state.dart';

const generalFailuresMessage = 'Uh Oh Something Gone Wrong , Please Try Again';
const chacheFailuresMessage = 'Uh Oh Chache Failed, Please Try Again';
const serverFailuresMessage = 'Uh Oh API Error, Please Try Again';

class AdvicerCubit extends Cubit<AdvicerState> {
  AdvicerCubit() : super(AdvicerInitial());
  final AdviceUsecase adviceUsecase = AdviceUsecase();
  void adviceRequested() async {
    emit(AdvicerStateLoading());
    final adviceOrFailure = await adviceUsecase.getAdvice();
    adviceOrFailure.fold(
        (advice) => emit(AdvicerStateLoaded(advice: advice.advice)),
        (failures) =>
            emit(AdvicerStateError(errorMsg: _typeOfFailureMessage(failures))));
  }

  String _typeOfFailureMessage(Failures failures) {
    switch (failures.runtimeType) {
      case ServerFailures:
        return serverFailuresMessage;
      case ChacheFailures:
        return chacheFailuresMessage;
      default:
        return generalFailuresMessage;
    }
  }
}
