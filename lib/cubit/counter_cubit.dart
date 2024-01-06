import 'package:flutter_bloc/flutter_bloc.dart';
/**
 * 1. diff between pkg "bloc" and flutter_bloc - > it has dedicated widgets plus flutter_bloc contains bloc pkg

    2. 2 approaches to manage state using bloc -> 1. using bloc state management 2. cubit
    both has pros and cons
 */

/// this file's state is being managed by cubit not bloc. Hence the name
class CounterCubit extends Cubit<int> {
  /// whenever extend a class it's constructr gets called
  /// if it has parameterized const then we also have to pass that parameter
  /// it order to extend it
  /// Here -> Cubit const needs a parameter (State) with initial value
  CounterCubit() : super(0);

  /// calling the super class constructor with
  /// the initial value of our counter(int)
  /// here (0) but can be passed any type of value
  /// the type of value can be passed here determined by the type cast given at
  /// time of extending the Cubit class
  void increment() {
    print('before: $state');
    emit(state + 1); /// it would update the state and would notify to all the
    /// listerner, listening to the state
    print('after: $state');
  }
  void decrement(){
    if(state>0) {
      emit(state-1);
      /// this emit function can't be used in the UI or the classes
      /// which are not inheriting the Cubit class
    }
  }
}
