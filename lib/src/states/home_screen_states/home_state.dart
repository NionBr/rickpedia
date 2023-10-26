import 'package:myapp/src/models/character_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState(this.error);
}

class HomeSuccessState extends HomeState {
  final List<CharacterModel> characters;

  HomeSuccessState(this.characters);
}
