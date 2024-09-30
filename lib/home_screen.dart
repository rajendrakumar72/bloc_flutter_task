import 'package:flutter_bloc/flutter_bloc.dart';

// 1. Define Events (Increment and Decrement)
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

// 2. Define States (Holding counter value)
abstract class CounterState {}

class CounterValueState extends CounterState {
  final int counterValue;
  CounterValueState(this.counterValue);
}

// 3. Create BLoC (Manages events and emits states)
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterValueState(0)) {
    // Register event handlers using the `on<Event>` API
    on<IncrementEvent>((event, emit) {
      final currentCounterValue = (state as CounterValueState).counterValue;
      emit(CounterValueState(currentCounterValue + 1)); // Emit new state with incremented value
    });

    on<DecrementEvent>((event, emit) {
      final currentCounterValue = (state as CounterValueState).counterValue;
      emit(CounterValueState(currentCounterValue - 1)); // Emit new state with decremented value
    });
  }
}


