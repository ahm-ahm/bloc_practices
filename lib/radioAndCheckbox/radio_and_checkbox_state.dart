import 'package:equatable/equatable.dart';

import 'day.dart';

class RadioAndCheckBoxState extends Equatable {
  final int selectionFlag;
  final List<Day> days;
  // final int secondSelected;

  const RadioAndCheckBoxState({required this.selectionFlag,required this.days});

  const RadioAndCheckBoxState.initial(this.selectionFlag,this.days);

  RadioAndCheckBoxState copyWith({int? selectionF ,List<Day>? days})
  {
    return RadioAndCheckBoxState(selectionFlag:selectionF?? selectionFlag,days: days??this.days);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [selectionFlag,days];
}
