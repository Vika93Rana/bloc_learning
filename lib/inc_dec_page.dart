import 'package:bloc_learning/bloc/counter_bloc.dart';
import 'package:bloc_learning/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncDecPage extends StatelessWidget {
  const IncDecPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // counterCubit.increment();
              counterBloc.add(CounterIncremented());
            },

            /// now we need this conterCubit instance from the home_page
            /// it can be accesed via Constructor of this file
            /// but i am using Gorouter
            /// if i do this -> CounterCubit().increment()
            /// its same like creating another instance
            /// and will not reflect the change in UI
            /// ans- > blocProvider
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterDecremented());
              // counterCubit.decrement()
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
