import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CounterState {
  int counterValue;

  CounterState({@required this.counterValue});
}

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void incrementCounter() =>
      emit(CounterState(counterValue: state.counterValue + 1));

  void decrementCounter() =>
      emit(CounterState(counterValue: state.counterValue - 1));
}
