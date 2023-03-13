import 'package:bloc/bloc.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(Initial()) {
    on<FetchData>(((FetchData event, Emitter<DataState> emit) async {
      emit(Loading());
      await Future.delayed(const Duration(seconds: 2));

      emit(Success());
    }));
  }
}

///dataState
abstract class DataState {}

class Initial extends DataState {}

class Loading extends DataState {}

class Success extends DataState {}

///dataEvent
abstract class DataEvent {}

class FetchData extends DataEvent {}
