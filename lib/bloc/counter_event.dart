
part of 'counter_bloc.dart';

/// with the help of 'part of' we can do multiple things
sealed class CounterEvent{
  /// sealed -> todo: find out about sealed keyword
}


///Name of bloc + action it is performing
class CounterIncremented extends CounterEvent {}
class CounterDecremented extends CounterEvent {}