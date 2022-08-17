import 'package:flutter/material.dart';
import 'package:flutter_codigo_state/pages/register_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/superhero/superhero_bloc.dart';
import '../models/superhero_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegistePage()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          "Home",
        ),
      ),
      body: BlocBuilder<SuperheroBloc, SuperheroState>(
        builder: (BuildContext context, SuperheroState state) {
          print(state.superheroModel);
          if (state.superheroModel != null) {
            return InfoSuperheroWidget(
              superheroModel: state.superheroModel!,
            );
          }
          return Center(
            child: Text("No hay nada registrado"),
          );
        },
      ),
    );
  }
}

class InfoSuperheroWidget extends StatelessWidget {
  SuperheroModel superheroModel;

  InfoSuperheroWidget({required this.superheroModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
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
            title: Text(superheroModel.name),
            subtitle: Text("Nombre del personaje"),
          ),
          ListTile(
            title: Text("${superheroModel.experience} años"),
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
          ...superheroModel.skills
              .map(
                (e) => ListTile(
                  title: Text(e),
                  subtitle: Text("Número: 1"),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
