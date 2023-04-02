import 'package:bloc_practice/dio-internet/my_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Error_widget.dart';
import 'model.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<MyDataBloc>().getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Data'),
      ),
      body: BlocBuilder<MyDataBloc, DataEvent>(
        builder: (context, dataEvent) {
          if (dataEvent is Initial) {
            return const SizedBox();
          } else if (dataEvent is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (dataEvent is Data) {
            final list = dataEvent.data as List<Model>;
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, i) {
                  return Card(
                    child: ListTile(
                      leading: Text((i + 1).toString()),
                      title: Text(list[i].title.toString()),
                    ),
                  );
                });
          } else if (dataEvent.toString().contains('No internet')) {
            return SingleErrorTryAgainWidget(
              message: 'Data',
              onClick: () {
                context.read<MyDataBloc>().getData();
              },
              bottomMargin: 20,
            );
          }
          return SingleErrorTryAgainWidget(
            message: dataEvent
                .toString()
                .replaceAll('Exception:', '')
                .replaceAll('DioError', ''),
            onClick: () {
              context.read<MyDataBloc>().getData();
            },
            bottomMargin: 20,
          );

          // }
        },
      ),
    );
  }
}
