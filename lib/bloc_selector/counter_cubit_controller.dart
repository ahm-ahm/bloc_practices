import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  static int initState = 0;
  CounterCubit() : super(initState);

  void get increemnt => emit(state + 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
  }
}
