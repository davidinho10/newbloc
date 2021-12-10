import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter:0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async*{
    print('Bloc Event ${event.toString()}');

    if(event is IncrementEvent){
      print('Bloc Increment clicked');
      yield CounterState(counter: state.counter + 1);
    }else if (event is DecrementEvent){
      yield CounterState(counter: state.counter - 1);
    }else {
      print('ERROR');
    }
  }
}
