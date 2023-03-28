import 'package:bloc/bloc.dart';
import 'package:bloc_practice/radioAndCheckbox/radio_and_checkbox_state.dart';

import 'day.dart';

class RadioBloc extends Cubit<RadioAndCheckBoxState> {
  static const firstRadio = 1;
  static const secondRadio = 2;
  static const thirdRadio = 3;
  final datetime = DateTime.now();

  RadioBloc() : super(const RadioAndCheckBoxState(selectionFlag: 0, days: [])){
    final days =
    List.generate(2, (index) => datetime.add(Duration(days: index + 1)))
        .map((e) => Day.initial(
        e, 'Chicken Korma'))
        .toList();
    emit(state.copyWith(days: days));
  }

  onUpdate(int? selection, int f) {
    emit(state.copyWith(selectionF: f));
  }


  onUpdateCheckbox(bool? checked,int index,Day day) {
    print('index:$index');


    final previousDays = List<Day>.from(state.days);
    final day = previousDays[index];
    final updatedDay = day.copyWith(!day.isChecked);
    previousDays.remove(day);
    previousDays.insert(index, updatedDay);
    emit(state.copyWith(days: previousDays));
  }
}
