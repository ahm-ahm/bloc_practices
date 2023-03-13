import 'dart:async';

import 'package:flutter/material.dart';

class StreamGloballyCounter extends StatelessWidget {
  const StreamGloballyCounter({super.key});
  @override
  Widget build(BuildContext context) {
    final globallyStream = StreamGlobally();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
        actions: [
          StreamBuilder<int>(
              initialData: globallyStream.counter,
              stream: globallyStream.stream,
              builder: (_, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(state.data.toString()),
                    ],
                  ),
                );
              })
        ],
      ),
      body: StreamBuilder<int>(
          initialData: globallyStream.counter,
          stream: globallyStream.stream,
          builder: (_, state) {
            return Center(child: Text(state.data.toString()));
          }),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
                heroTag: 'increment',
                child: const Icon(Icons.add),
                onPressed: () {
                  globallyStream.inputEvent;
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                  heroTag: 'navigate',
                  child: const Icon(Icons.next_plan),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return StreamGloballyCounter1(
                              globallyStream: globallyStream);
                        },
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class StreamGloballyCounter1 extends StatelessWidget {
  final StreamGlobally globallyStream;
  const StreamGloballyCounter1({super.key, required this.globallyStream});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Received value of stream'),
        actions: [
          StreamBuilder<int>(
              initialData: globallyStream.counter,
              stream: globallyStream.stream,
              builder: (_, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(state.data.toString()),
                    ],
                  ),
                );
              })
        ],
      ),
      body: StreamBuilder<int>(
          initialData: globallyStream.counter,
          stream: globallyStream.stream,
          builder: (_, state) {
            return Center(child: Text(state.data.toString()));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          globallyStream.inputEvent;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class StreamGlobally {
  int counter = 0;
  StreamController<int> stateController = StreamController.broadcast();
  // void get sinkState => stateController.sink.add(counter);
  Stream<int> get stream => stateController.stream;

  // StreamController<int> eventController = StreamController();
  void get inputEvent => stateController.sink.add(++counter);

  ///============no need to call stream,it's just automatically listening
  // Stream<int> get eventStream => stateController.stream;
}
