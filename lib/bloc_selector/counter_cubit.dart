import 'package:bloc_practice/cubit/counter_cubit_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitScreen extends StatelessWidget {
  const CounterCubitScreen({super.key});

  ///=============================builder is under the control of selector .
  ///state returned by selector , will be used in builder and rebuilding that widget/widgets
  @override
  Widget build(BuildContext context) {
    print(
        'to get the selected value-------------------${context.select((CounterCubit b) => b.state >= 0)}');
    return Scaffold(
      body: Center(
          child:
              BlocSelector<CounterCubit, dynamic, dynamic>(selector: ((state) {
        print('state selected  $state');
        if (state == 5) {
          ///5 will returned
          return state;
        }
      }), builder: (context, state) {
        print('state builder  $state');

        ///5 will be result

        // return Text(context.watch<CounterCubit>().state.toString());
        return Text(state.toString());
      })),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<CounterCubit>().increemnt;
      }),
    );
  }
}
