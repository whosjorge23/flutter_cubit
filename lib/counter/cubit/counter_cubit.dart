import 'package:cubit_freezed/counter/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Create Cubit
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0));

  void increment() {
    emit(CounterState(state.count + 1));
  }

  void decrement() {
    emit(CounterState(state.count - 1));
  }
}