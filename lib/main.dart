import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codigo_state/bloc/calculator/calculator_bloc.dart';
import 'package:flutter_codigo_state/pages/calculator_page.dart';
import 'package:flutter_codigo_state/pages/home_page.dart';

import 'bloc/superhero/superhero_bloc.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>CalculatorBloc()),
        BlocProvider(create: (_)=>SuperheroBloc()),
      ],
      child: MaterialApp(
        title: "States",
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}