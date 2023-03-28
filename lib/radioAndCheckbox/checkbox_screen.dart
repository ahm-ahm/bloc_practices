import 'package:bloc_practice/radioAndCheckbox/radio_bloc.dart';
import 'package:bloc_practice/radioAndCheckbox/radio_and_checkbox_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckBoxScreen extends StatelessWidget {
  const CheckBoxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc=context.read<RadioBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('RadioButton'),
      ),
      body: BlocBuilder<RadioBloc,RadioAndCheckBoxState>(
        buildWhen: (pre,cur){
          print('--------------current ${cur.days}  pre:${pre.days}');
          return pre.days!=cur.days;
        },
          builder: (context,state) {
            return ListView.builder(
                itemCount: state.days.length,
                itemBuilder: (_,index){
                  final day=state.days[index];
              return CheckboxListTile(
                  title: Text(day.title),
                  value:day.isChecked ,  onChanged:(v){
                bloc.onUpdateCheckbox(v,index,day);
              });
            });
          }
      ),
    );
  }
}
