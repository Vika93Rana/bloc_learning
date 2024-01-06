import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

/// if counter_event were not made part of this file, due to the final
/// and sealed keyword we could not be able to use them in this file
/// but using the 'part of; keyword in that file the 2 files are
/// considered 1 file.

class CounterBloc extends Bloc<CounterEvent, int> {
  ///Event-> input to a bloc, e.g. button pressed -> that can be passed to
  ///Bloc using which we can update the state
  CounterBloc() : super(0) {
    on<CounterIncremented>((event, emit) {
      emit(state + 1);

      /// the emit function of bloc can't be used outside the event handler
      /// like the way they can be used in cubit
    });
    on<CounterDecremented>((event, emit) {
      if (state > 0) {
        emit(state - 1);
      }
    });
  }
}
