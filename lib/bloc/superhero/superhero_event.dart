part of 'superhero_bloc.dart';

@immutable
abstract class SuperheroEvent {}

class SuperheroCreateEvent extends SuperheroEvent {
  SuperheroModel superheroModel;
  SuperheroCreateEvent({required this.superheroModel});
}

class SuperheroUpdateExperienceEvent extends SuperheroEvent {
  int experience;
  SuperheroUpdateExperienceEvent({required this.experience,});
}

class SuperheroAddSkillEvent extends SuperheroEvent {
  String skill;
  SuperheroAddSkillEvent({required this.skill});
}
