import 'package:bloc_learning/bloc/counter_bloc.dart';
import 'package:bloc_learning/cubit/counter_cubit.dart';
import 'package:bloc_learning/inc_dec_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  /// replace the counter var with Cubit state
  /// int counter = CounterCubit().state; /// this state property is coming from Cubit
  /// in the above code we are creating another instance of countercubit

  // final counterCubit = CounterCubit();
  /// it becomes irrelevant after using the BlocProvider
  @override
  Widget build(BuildContext context) {
    // int counter = counterCubit.state;

    /// line keeps returing the initial value
    /// of the state but not listening to the change happening in the state
    /// there is a dedicated widget to it -> BlocBuilder

    final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    /// after that we don't even need the stateful widget
    /// it can be converted to stateless widget
//todo: Use GoRouter to learn
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, int>(

                /// whenever the state of bloc changes or the state of CounterCubit
                /// change -> the builder run again
                /// the reason why the BlocBuilder is not wrapped around the Scaffold
                /// is that if the state will change the entire widget tree will rebuild
                /// but we wanted only Text() widget to rebuild
                // bloc: counterBloc,
                /// the above line is optional when you are providing the bloc
                /// at the root of app but if you are making instances of bloc or cubit
                /// then you need to mention the 'bloc' prop
                builder: (context, counter) {
              return Text(
                '$counter',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const IncDecPage()));
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
