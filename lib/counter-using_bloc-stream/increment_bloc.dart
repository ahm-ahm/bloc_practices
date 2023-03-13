import 'dart:async';
import 'dart:developer';

import 'package:bloc_practice/snackbar-bloclistener/databloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementBloc extends BlocBase {
  IncrementBloc() : super(Initial()) {
    log('called');
    incrementStream.listen(_handleLogic);
  }
  int counter = 0;

  //
  // Stream to handle the counter
  //
  StreamController<int> counterController = StreamController();

  Stream get streamCounts => counterController.stream;
  void get sinkCounts => counterController.sink.add(counter);

  //
  // Stream to handle the action on the counter
  //
  StreamController actionController = StreamController();
  Stream get incrementStream => actionController.stream;
  void get incrementCounter => actionController.sink.add(++counter);

  void dispose() {
    actionController.close();
    counterController.close();
  }

  void _handleLogic(data) {
    log('data:$data');

    sinkCounts;
  }
}
