import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerState> {
  AdvicerCubit() : super(AdvicerInitial());

  void adviceRequested() async {
    emit(AdvicerStateLoading());
    await Future.delayed(const Duration(seconds: 3));
    debugPrint("get advice");
    emit(AdvicerStateLoaded());
  }
}
