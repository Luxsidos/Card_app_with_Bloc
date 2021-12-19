import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(myCount: 0)) {
    on<Increment>((event, emit) async {
      emit(CounterDecrement(myCount: state.myCount + 1));
      await Future.delayed(const Duration(seconds: 1));
      emit(CounterIncrement(myCount: state.myCount + 1));
    });

    on<Decrement>(
        (event, emit) => emit(CounterDecrement(myCount: state.myCount - 1)));
  }
}
