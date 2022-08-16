import 'package:flutter/material.dart';
import 'package:flutter_codigo_state/models/superhero_model.dart';
import 'package:flutter_codigo_state/pages/register_page.dart';
import 'package:flutter_codigo_state/providers/superhero_provider.dart';
import 'package:provider/provider.dart';

import '../providers/counter_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterProvider counterProvider = Provider.of<CounterProvider>(context);
    SuperheroProvider superheroProvider =
        Provider.of<SuperheroProvider>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          "Home",
        ),
        actions: [
          IconButton(
            onPressed: () {
              counterProvider.addCounter();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: superheroProvider.superHero == null
            ? Text("No hay registro")
            : InfoSuperheroWidget(superheroModel: superheroProvider.superHero!),
      ),
    );
  }
}

class InfoSuperheroWidget extends StatelessWidget {
  SuperheroModel superheroModel;

  InfoSuperheroWidget({
    required this.superheroModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Información del básica",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Divider(),
        ListTile(
          title: Text("Batman"),
          subtitle: Text("Nombre del personaje"),
        ),
        ListTile(
          title: Text("${superheroModel.experience.toString()} años"),
          subtitle: Text("Experiencia"),
        ),
        Divider(),
        Text(
          "Habilidades",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        ...superheroModel.skills.map(
          (e) => ListTile(
            title: Text(e),
            subtitle: Text("Número: 1"),
          ),
        ),
      ],
    );
  }
}
