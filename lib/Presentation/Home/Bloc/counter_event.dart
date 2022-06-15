part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}
class IncrementStarted extends CounterEvent {
  const IncrementStarted();
}
class DecrementStarted extends CounterEvent {
  const DecrementStarted();
}
class IncrementEvent extends CounterEvent {
  const IncrementEvent(this.count);
  final int count;

  @override
  List<Object> get props => [count];
}
class DecrementEvent extends CounterEvent {
  const DecrementEvent(this.count);
  final int count;

  @override
  List<Object> get props => [count];
}
