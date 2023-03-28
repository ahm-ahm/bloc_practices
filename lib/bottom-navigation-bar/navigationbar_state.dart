import 'package:equatable/equatable.dart';

class NavigationbarState extends Equatable {
  final int selecctedIndex;

  const NavigationbarState({required this.selecctedIndex});

   NavigationbarState.initial():this(selecctedIndex: 0);

  @override
  List<Object?> get props => [selecctedIndex];
}
