part of 'counter_bloc.dart';

@immutable
abstract class CounterState extends Equatable {
  const CounterState(this.count);
 final int count;
  @override
  List<Object> get props => [count];
}

class CounterInitial extends CounterState {
  CounterInitial(int count) : super(count);
}

class CounterSuccess extends CounterState {

  const CounterSuccess(this.count) : super(0);

  final int count;
  @override
  List<Object> get props => [count];
}

class CounterComplete extends CounterState {
  const CounterComplete(this.count) : super(0);
  final int count;
  @override
  List<Object> get props => [count];
}

