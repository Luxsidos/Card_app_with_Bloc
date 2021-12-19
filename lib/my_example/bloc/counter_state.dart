part of 'counter_bloc.dart';

@immutable
class CounterState {
  int myCount;
  CounterState({required this.myCount});
}

class CounterIncrement extends CounterState {
  CounterIncrement({required int myCount}) : super(myCount: myCount);
}

class CounterDecrement extends CounterState {
  CounterDecrement({required int myCount}) : super(myCount: myCount);
}
