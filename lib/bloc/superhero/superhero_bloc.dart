import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'superhero_event.dart';
part 'superhero_state.dart';

class SuperheroBloc extends Bloc<SuperheroEvent, SuperheroState> {
  SuperheroBloc() : super(SuperheroInitial()) {
    on<SuperheroEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
