import 'package:bloc_practice/counter-using_bloc-stream/increment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocStreamScreen extends StatefulWidget {
  const CounterBlocStreamScreen({super.key});

  @override
  State<CounterBlocStreamScreen> createState() =>
      _CounterBlocStreamScreenState();
}

class _CounterBlocStreamScreenState extends State<CounterBlocStreamScreen> {
  @override
  Widget build(BuildContext context) {
    final IncrementBloc bloc = BlocProvider.of<IncrementBloc>(context);

    return Scaffold(
      body: Center(
          child: StreamBuilder(
              initialData: bloc.counter,
              stream: bloc.streamCounts,
              builder: (_, snapshot) {
                return Text(snapshot.data.toString());
              })),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          bloc.incrementCounter;
        },
      ),
    );
  }
}
