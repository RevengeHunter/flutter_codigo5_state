import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codigo_state/cubit/superhero/superhero_cubit.dart';
import 'package:flutter_codigo_state/pages/register_page.dart';

import '../models/superhero_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistePage()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          "Home",
        ),
      ),
      body: BlocBuilder<SuperheroCubit,SuperheroState>(
        builder: (BuildContext context, SuperheroState state){
          print(state.runtimeType);
          switch(state.runtimeType){
            case SuperheroInit:
              // SuperheroInit superheroInit = state as SuperheroInit;
              bool value = (state as SuperheroInit).isCreatedSuperhero;
              // print(superheroInit.isCreatedSuperhero);
              return Center(
                child: Text("No hay nada registrado"),
              );
            case SuperheroCreated:
              SuperheroCreated superheroCreated = state as SuperheroCreated;
              return InfoSuperheroWidget(
                superheroModel: superheroCreated.superheroModel,
              );
            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}

class InfoSuperheroWidget extends StatelessWidget {
  SuperheroModel superheroModel;

  InfoSuperheroWidget({
    required this.superheroModel,
  });

  int countSkills = 0;
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
          Column(children: superheroModel.skills.map((e) => ListTile(
            title: Text(e),
            subtitle: Text("Número: ${countSkills++}"),
          )).toList(),),
        ],
      ),
    );
  }
}