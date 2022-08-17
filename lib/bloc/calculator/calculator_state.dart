part of "calculator_bloc.dart";

class CalculatorState {
  int number1;
  int number2;
  int result;

  CalculatorState({
    this.number1 = 0,
    this.number2 = 0,
    this.result = 0,
  });

  copyWith({int? n1,int? n2,int? res}){
    return CalculatorState(
      number1: n1 ?? number1,
      number2: n2 ?? number2,
      result: res ?? result,
    );
  }
}
