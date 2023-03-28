import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Cubit<int> {
  static const index = 0;
  //--constructor initialization of state
  NavigationBloc() : super(index);
//--to change page on index basis
  void pageChanged({required int index}) {
    emit(index);
  }
}
