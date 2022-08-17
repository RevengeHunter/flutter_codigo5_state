import 'package:flutter_bloc/flutter_bloc.dart';
part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState>{
  CalculatorBloc():super(CalculatorState()){

    on<AddNumber1>((event,emit){
      int data = event.number1;
      emit(state.copyWith(n1: data));
    });

    on<AddNumber2>((event,emit){
      int data = event.number2;
      emit(state.copyWith(n2: data));
    });

    on<CalculateResult>((event,emit){
      print(event);
      print(state.number1);
      print(state.number2);
      print(state.result);
      emit(state.copyWith(res: state.number1 + state.number2));
    });

  }

}