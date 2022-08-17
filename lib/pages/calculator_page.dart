import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/calculator/calculator_bloc.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (BuildContext context, CalculatorState state){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.number1.toString(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  MaterialButton(
                    color: Colors.indigo,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      BlocProvider.of<CalculatorBloc>(context).add(AddNumber1(number1: 100));
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.number2.toString(),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  MaterialButton(
                    color: Colors.indigo,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      BlocProvider.of<CalculatorBloc>(context).add(AddNumber2(number2: 40));
                    },
                  ),
                ],
              ),
              Divider(),
              Text(
                "Result: ${state.result}",
                style: TextStyle(
                  fontSize: 22.0,
                ),
              ),
              MaterialButton(
                color: Colors.indigo,
                child: Text("Calcular", style: TextStyle(color: Colors.white),),
                onPressed: () {
                  BlocProvider.of<CalculatorBloc>(context).add(CalculateResult());
                },
              ),
            ],
          );
        },
      ),
    );
  }
}