import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codigo_state/cubit/superhero/superhero_cubit.dart';

import '../models/superhero_model.dart';

class RegistePage extends StatelessWidget {
  const RegistePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.pinkAccent,
              child: Text("Agregar personaje"),
              onPressed: () {
                SuperheroModel superhero = SuperheroModel(
                  name: "Flash",
                  experience: 4,
                  skills: [
                    "Supervelocidad",
                    "Resistencia",
                  ],
                );
                context.read<SuperheroCubit>().createSuperhero(superhero);
              },
            ),
            MaterialButton(
              color: Colors.greenAccent,
              child: Text("Actualizar experiencia"),
              onPressed: () {
                context.read<SuperheroCubit>().updateExperience(20000);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text("Agregar habilidad"),
              onPressed: () {
                context.read<SuperheroCubit>().addSkill("super metabolismo");
              },
            ),
          ],
        ),
      ),
    );
  }
}
