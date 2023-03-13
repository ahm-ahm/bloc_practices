import 'dart:async';

enum Event { increment, decrement }

class CounterController {
  int counter = 0;

  StreamSubscription? listener;
  CounterController() {
    listener = counterActionStream.listen((event) {
      // switch (event) {
      //   case Event.increment:
      //     incrementCounter;

      //     break;
      //   case Event.decrement:
      //     decrementCounter;
      //     break;
      //   default:
      // }
      // counterStateSink;
    });
  }
  //
  // Stream to handle the counter
  //
  StreamController<int> counterStateController = StreamController();
  Stream<int> get counterStateStream => counterStateController.stream;
  void get counterStateSink => counterStateController.sink.add(counter);

  //
  // Stream to handle the action on the counter
  //
  StreamController counterActionController = StreamController();
  Stream get counterActionStream => counterActionController.stream;
  void get incrementCounter => {
        //to tell the stream at sink(input) end of streamController
        counterActionController.sink.add(++counter),
        //to tell the stream for incoming new value to the stream(output) end of streamController
        counterStateSink,
      };
  void get decrementCounter => {
        //to tell the stream at sink(input) end of streamController
        counterActionController.sink.add(--counter),
        //to tell the stream for incoming new value to the stream(output) end of streamController
        counterStateSink,
      };

  void dispose() {
    counterActionController.close();
    counterStateController.close();
  }
}
