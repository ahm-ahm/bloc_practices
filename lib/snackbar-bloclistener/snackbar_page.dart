import 'package:bloc_practice/snackbar-bloclistener/databloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SnackbarPage extends StatelessWidget {
  const SnackbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///==========add success case after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      context.read<DataBloc>().add(FetchData());
    });
    return Scaffold(
      body: Center(
        child: BlocListener<DataBloc, DataState>(
          listenWhen: (pre, next) {
            return pre != next;
          },
          listener: (context, state) {
            if (state is Success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Success'),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          child: BlocBuilder<DataBloc, DataState>(buildWhen: (pre, next) {
            return pre != next;
          }, builder: (context, state) {
            if (state is Initial) {
              return const CircularProgressIndicator();
            } else if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const Text('Success');
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: const Icon(Icons.start),
          onPressed: () {
            context.read<DataBloc>().add(FetchData());
          }),
    );
  }
}
