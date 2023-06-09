import 'package:bloc_practice/bloc-stream/user_bloc.dart';
import 'package:bloc_practice/bloc-stream/user_screen.dart';
import 'package:bloc_practice/camera/camera_screen.dart';
import 'package:bloc_practice/counter-using_bloc-stream/increment_bloc.dart';
import 'package:bloc_practice/cubit/counter_cubit_controller.dart';
import 'package:bloc_practice/radioAndCheckbox/checkbox_screen.dart';
import 'package:bloc_practice/radioAndCheckbox/radio_bloc.dart';
import 'package:bloc_practice/radioAndCheckbox/radio_button_screen.dart';
import 'package:bloc_practice/snackbar-bloclistener/databloc.dart';
import 'package:bloc_practice/snackbar-bloclistener/snackbar_page.dart';
import 'package:bloc_practice/stream-globally-counter/stream_globally_counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_selector/counter_cubit.dart';
import 'bottom-navigation-bar/NavigationbarBloc.dart';
import 'bottom-navigation-bar/bottom_navigation_bar_screen.dart';
import 'bottom-navigation-bar/custom_bottom_navigation_screen.dart';
import 'bottom-navigation-bar/navigation_bloc.dart';
import 'counter-app-using-streams/counter_bloc_stream_screen.dart';
import 'counter-using_bloc-stream/counter_bloc_stream_screen.dart';
import 'custom_stream/customStreamScreen.dart';
import 'dio-internet/my_data_bloc.dart';
import 'dio-internet/data_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(providers: [
        // BlocProvider<DataBloc>(create: (_) => DataBloc()),
        // BlocProvider<CounterCubit>(create: (_) => CounterCubit()),
        // BlocProvider<IncrementBloc>(create: (_) => IncrementBloc()),
        // BlocProvider<RadioBloc>(create: (_) => RadioBloc()),
        // BlocProvider<NavigationbarBloc>(create: (_) => NavigationbarBloc()),
        // BlocProvider<NavigationBloc>(create: (_) => NavigationBloc()),
        BlocProvider<MyDataBloc>(create: (_) => MyDataBloc()),
      ], child: const DataScreen()),
    );
  }
}
