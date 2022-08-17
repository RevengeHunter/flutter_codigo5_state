import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codigo_state/bloc/superhero/superhero_bloc.dart';
import 'package:flutter_codigo_state/models/superhero_model.dart';

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
                  name: "Wonder Woman",
                  experience: 4000,
                  skills: [
                    "Superfuerza",
                  ],
                );
                BlocProvider.of<SuperheroBloc>(context)
                    .add(SuperheroCreateEvent(superheroModel: superhero));
              },
            ),
            MaterialButton(
              color: Colors.greenAccent,
              child: Text("Actualizar experiencia"),
              onPressed: () {
                BlocProvider.of<SuperheroBloc>(context).add(SuperheroUpdateExperienceEvent(experience: 10950));
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text("Agregar habilidad"),
              onPressed: () {
                BlocProvider.of<SuperheroBloc>(context).add(SuperheroAddSkillEvent(skill: "Volar"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
