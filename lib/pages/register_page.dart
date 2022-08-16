import 'package:flutter/material.dart';
import 'package:flutter_codigo_state/models/superhero_model.dart';
import 'package:flutter_codigo_state/providers/superhero_provider.dart';
import 'package:provider/provider.dart';

import '../providers/counter_provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterProvider counterProvider = Provider.of<CounterProvider>(context);
    SuperheroProvider superheroProvider =
        Provider.of<SuperheroProvider>(context);

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
                SuperheroModel superheroModel = SuperheroModel(
                  name: "Superman",
                  experience: 2000,
                  skills: ["Volar","Super fuerza"],
                );
                superheroProvider.createSuperhero(superheroModel);
              },
            ),
            MaterialButton(
              color: Colors.greenAccent,
              child: Text("Actualizar experiencia"),
              onPressed: () {
                superheroProvider.updateExperience(52220);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text("Agregar habilidad"),
              onPressed: () {
                superheroProvider.addSkill("Rayos X");
              },
            ),
          ],
        ),
      ),
    );
  }
}
