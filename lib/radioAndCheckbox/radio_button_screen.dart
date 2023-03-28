import 'package:bloc_practice/radioAndCheckbox/radio_bloc.dart';
import 'package:bloc_practice/radioAndCheckbox/radio_and_checkbox_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadioButtonScreen extends StatelessWidget {
  const RadioButtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc=context.read<RadioBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('RadioButton'),
      ),
      body: Column(
        children: [
          BlocBuilder<RadioBloc,RadioAndCheckBoxState>(
            buildWhen: (pre,cur){
              return pre.selectionFlag!=cur.selectionFlag;
            },
              builder: (context,state) {
                return Column(
                  children: [
                    RadioListTile(
                        title:const Text('First Group'),
                        value: RadioBloc.firstRadio, groupValue: state.selectionFlag, onChanged:(v){
                      bloc.onUpdate(v,RadioBloc.firstRadio);
                    }),
                    RadioListTile(
                        title:const Text('Second Group'),
                        value: RadioBloc.secondRadio, groupValue: state.selectionFlag, onChanged:(v){
                      bloc.onUpdate(v,RadioBloc.secondRadio);
                    }),
                    RadioListTile(
                        title:const Text('Third Group'),
                        value: RadioBloc.thirdRadio, groupValue: state.selectionFlag, onChanged:(v){
                      bloc.onUpdate(v,RadioBloc.thirdRadio);
                    })
                  ],
                );
              }
          ),
        ],
      ),
    );
  }
}
