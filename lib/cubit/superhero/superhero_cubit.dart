import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_codigo_state/models/superhero_model.dart';
part 'superhero_state.dart';


class SuperheroCubit extends Cubit<SuperheroState>{

  SuperheroCubit(): super(SuperheroInit());

  //
  createSuperhero(SuperheroModel model){
    emit(SuperheroCreated(superheroModel: model));
  }

  //
  updateExperience(int exp){
    // SuperheroCreated superheroCreated = state as SuperheroCreated;
    // superheroCreated.superheroModel.experience = exp;
    // emit(SuperheroCreated(superheroModel: superheroCreated.superheroModel));

    final SuperheroState currentState = state;
    if(currentState is SuperheroCreated){
      final SuperheroModel newSuperhero = currentState.superheroModel.copyWith(newExperience: exp);
      emit(SuperheroCreated(superheroModel: newSuperhero));
    }
  }

  //
  addSkill(String skill){
    final SuperheroState currentState = state;
    if(currentState is SuperheroCreated){
      List<String> skills =  currentState.superheroModel.skills;
      skills.add(skill);
      final SuperheroModel newSuperhero = currentState.superheroModel.copyWith(newSkills: skills);
      emit(SuperheroCreated(superheroModel: newSuperhero));
    }
  }
}