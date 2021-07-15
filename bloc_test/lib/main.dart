import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_bloc.dart';
import 'counter_cubit.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext parentContext) {
    return MaterialApp(
        home: Scaffold(
      body: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: MyWidget(),
      ),
    ));
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                context.read<CounterCubit>().incrementCounter();
              }),
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text("${state.counterValue}");
            },
          ),
        ],
      ),
    );
  }
}
