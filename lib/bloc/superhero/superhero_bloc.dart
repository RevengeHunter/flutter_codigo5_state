import 'package:bloc/bloc.dart';
import 'package:flutter_codigo_state/models/superhero_model.dart';
import 'package:meta/meta.dart';

part 'superhero_event.dart';

part 'superhero_state.dart';

class SuperheroBloc extends Bloc<SuperheroEvent, SuperheroState> {
  SuperheroBloc() : super(SuperheroState()) {
    on<SuperheroCreateEvent>((event, emit) {
      emit(SuperheroState(superheroModel: event.superheroModel));
    });

    on<SuperheroUpdateExperienceEvent>((event, emit) {
      emit(
        SuperheroState(
          superheroModel: state.superheroModel!.copyWith(
            newExperience: event.experience,
          ),
        ),
      );
    });

    on<SuperheroAddSkillEvent>((event, emit) {
      List<String> skills = state.superheroModel!.skills;
      skills.add(event.skill);
      emit(
        SuperheroState(
          superheroModel: state.superheroModel!.copyWith(
            newSkills: skills,
          ),
        ),
      );
    });
  }
}