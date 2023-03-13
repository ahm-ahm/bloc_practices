import 'dart:async';

import 'package:flutter/material.dart';

import 'counter_controller.dart';

class CounterBlocUsingStream extends StatefulWidget {
  @override
  State<CounterBlocUsingStream> createState() => _CounterBlocUsingStreamState();
}

class _CounterBlocUsingStreamState extends State<CounterBlocUsingStream> {
  late CounterController _counterController;
  @override
  void initState() {
    _counterController = CounterController();
    super.initState();
  }

  @override
  void dispose() {
    _counterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Streams"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(),
          Center(
              child: StreamBuilder<int>(
                  // stream: _counterController.counterStateStream,
                  stream: stream,
                  initialData: 0,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<int> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      return Text(
                        '$count',
                        style: Theme.of(context).textTheme.headline4,
                      );
                    } else {
                      return Text(
                        'Empty data',
                        style: Theme.of(context).textTheme.headline4,
                      );
                    }
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                // onPressed: () => _counterController.decrementCounter,
                onPressed: () => decrement(),
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                // onPressed: () => _counterController.incrementCounter,
                onPressed: () => increment(),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}

///==========in simplest way to implement stream using bloc
int count = 0;
StreamController<int> streamController = StreamController.broadcast();

///=======get stream of data
Stream<int> get stream => streamController.stream;

///===========add data via event
increment() {
  streamController.sink.add(++count);
}

decrement() {
  if (count > 0) {
    streamController.sink.add(--count);
  }
}
