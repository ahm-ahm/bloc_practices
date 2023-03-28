import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bottom-navigation-bar/navigationbar_state.dart';

class NavigationbarBloc extends Cubit<NavigationbarState>{
  NavigationbarBloc():super(NavigationbarState.initial());

  updateIndex(int index){
    emit(NavigationbarState(selecctedIndex: index));
  }

}