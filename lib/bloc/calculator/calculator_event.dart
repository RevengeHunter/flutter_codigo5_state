part of "calculator_bloc.dart";

class CalculatorEvent{}

class AddNumber1 extends CalculatorEvent{
  int number1;
  AddNumber1({required this.number1});
}

class AddNumber2 extends CalculatorEvent{
  int number2;
  AddNumber2({required this.number2});
}
class CalculateResult extends CalculatorEvent{}
class Reset{}