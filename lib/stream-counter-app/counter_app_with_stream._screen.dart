import 'dart:async';

import 'package:flutter/material.dart';

class CounterPageWithStream extends StatefulWidget {
  const CounterPageWithStream({Key? key}) : super(key: key);
  @override
  _CounterPageWithStreamState createState() => _CounterPageWithStreamState();
}

class _CounterPageWithStreamState extends State<CounterPageWithStream> {
  int _counter = 0;
  final StreamController<int> _streamController = StreamController<int>();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream version of the Counter App')),
      body: Center(
        child: StreamBuilder<int>(
            stream: _streamController.stream,
            initialData: _counter,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text('You hit me: ${snapshot.data} times');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _streamController.sink.add(++_counter);
        },
      ),
    );
  }
}
