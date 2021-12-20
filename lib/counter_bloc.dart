import 'dart:async';
import 'package:dynamic_theme_flutter_bloc/counter_event.dart';
import 'package:dynamic_theme_flutter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{
  /**
      int _counter = 0;

      void _incrementCounter() {
      setState(() {
      _counter++;
      });
      }

      void _decrementCounter() {
      setState(() {
      _counter--;
      });
      }
   */
  void onIncrement(){
    add(IncrementEvent());
  }
  void onDecrement(){
    add(DecrementEvent());
  }



  @override
  // TODO: implement initialState
  CounterState get initialState => CounterState.initial();

  @override
  Stream<CounterState> mapEventToState(CounterEvent event)async* {
    // TODO: implement mapEventToState
    if (event is IncrementEvent) {
      yield CounterState(counter:state.counter+1);

    } else if (event is DecrementEvent) {
      yield CounterState(counter:state.counter-1);
    }
  }

}

/**
  int _counter = 0;
//StreamController is a tool help reading----
  final _counterStateController = StreamController<int>();
  //input---------------private----------
  StreamSink<int> get _inController => _counterStateController.sink;
  //output----------global----------
  Stream<int> get outController =>  _counterStateController.stream;


//streamEvent to distinguish between input or output
  final _counterEventController = StreamController<CounterEvent> ();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;


  //to receive the event---------------
  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  //the map
  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }
    _inController.add(_counter);
  }

  // stop bloc streams to save memory-----------
  void dispose(){
    _counterStateController.close();
    _counterEventController.close();
  }
}
    */