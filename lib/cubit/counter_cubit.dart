import 'package:bloc_practice/cubit/counter_cubit_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitScreen extends StatelessWidget {
  const CounterCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: BlocBuilder<CounterCubit, int>(buildWhen: (pre, next) {
        return pre != next;
      }, builder: (context, state) {
        // return Text(context.watch<CounterCubit>().state.toString());
        return Text(state.toString());
      })),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<CounterCubit>().increemnt;
      }),
    );
  }
}
