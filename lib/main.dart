import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codigo_state/cubit/superhero/superhero_cubit.dart';
import 'package:flutter_codigo_state/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => SuperheroCubit()),
      ],
      child: MaterialApp(
        title: "States",
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}