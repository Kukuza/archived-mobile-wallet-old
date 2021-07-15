import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_bloc.dart';
import 'counter_cubit.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext parentContext) {
    return MaterialApp(
        home: Scaffold(
      key: scaffoldKey,
      body: BlocProvider<CounterCubit>(
        create: (context) => CounterCubit(),
        child: MyWidget(
          scaffoldKey: scaffoldKey,
        ),
      ),
    ));
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({
    Key key,
    @required this.scaffoldKey,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                context.read<CounterCubit>().incrementCounter();
              }),
          BlocConsumer<CounterCubit, CounterState>(
            listener: (context, state) {
              if (state.wasIncremented) {
                scaffoldKey.currentState.showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 200),
                    content: Text("Incremented")));
              } else if (state.wasIncremented == false) {
                scaffoldKey.currentState.showSnackBar(SnackBar(
                    duration: Duration(milliseconds: 200),
                    content: Text("Decremented")));
              }
            },
            builder: (context, state) {
              return Text("${state.counterValue}");
            },
          ),
          IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                context.read<CounterCubit>().decrementCounter();
              }),
        ],
      ),
    );
  }
}
