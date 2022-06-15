part of 'counter_bloc.dart';

@immutable
abstract class CounterState extends Equatable {
  const CounterState(this.count,);
 final int count;
  @override
  List<Object> get props => [count];
}

class CounterInitial extends CounterState {
  const CounterInitial(int count,) : super(count);
}

class CounterComplete extends CounterState {
  const CounterComplete(this.count) : super(0);
  final int count;

  @override
  List<Object> get props => [count];
}

