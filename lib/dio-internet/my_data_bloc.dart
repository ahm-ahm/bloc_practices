import 'package:bloc/bloc.dart';
import 'package:bloc_practice/dio-internet/web-service/web-service.dart';
import 'package:dio/dio.dart';

class MyDataBloc extends Cubit<DataEvent> {
  MyDataBloc() : super(Initial());

// final _sharedWebService=WebServices
  getData() async {
    if (state is Data) return;
    emit(Loading());
    try {
      final response = await WebServices.getData();
      if (response is DioError) {
        print('exception is =====================$response');
        if (response.toString().contains('connection timeout')) {
          emit(Error(exception: Exception('No Internet connection')));
        } else {
          emit(Error(exception: Exception('Something went wrong')));
        }
      } else {
        print('else=====================$response');

        emit(Data(data: response));
      }
      // else {
      //   print('e= state==================$state');
      //
      //   emit(Error(exception: Exception(response.toString())));
      //
      //
      // }
    } catch (e) {
      print('e===================$e');
      emit(Error(exception: Exception(e.toString())));
    }
  }
}

abstract class DataEvent {}

class Initial extends DataEvent {}

class Loading extends DataEvent {}

class Error extends DataEvent {
  final Exception exception;

  Error({required this.exception});

  @override
  String toString() {
    return 'Exception: ${exception.toString()}';
  }
}

class Data<T> extends DataEvent {
  final T data;

  Data({required this.data});

  @override
  String toString() {
    return 'Data: ${data.toString()}';
  }
}
