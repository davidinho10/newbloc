import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  increment() => {
    print('increment clicked'),
    emit(state +1),
  };

  decrement() => {
    print('Decrement clicked'),
    emit(state - 1),
  };

}
