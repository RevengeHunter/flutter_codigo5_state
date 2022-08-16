part of 'superhero_cubit.dart';

@immutable
abstract class SuperheroState{}

class SuperheroInit extends SuperheroState{

  final bool isCreatedSuperhero = false;

}

class SuperheroCreated extends SuperheroState{
  final bool isCreatedSuperhero = true;
  final SuperheroModel superheroModel;
  SuperheroCreated({required this.superheroModel});
}

class SuperheroPrueba{

}