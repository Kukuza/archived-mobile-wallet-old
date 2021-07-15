import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CounterState {
  int counterValue;
  bool wasIncremented;
  CounterState({@required this.counterValue, this.wasIncremented});
}

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void incrementCounter() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrementCounter() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));
}
