import 'package:flutter/material.dart';
import 'package:myapp/src/services/character_service.dart';
import 'package:myapp/src/states/home_screen_states/home_state.dart';

class CharacterStore extends ValueNotifier<HomeState> {
  final CharacterService service;

  CharacterStore(this.service) : super(HomeInitialState());

  Future getAllCharacters(int page) async {
    value = HomeLoadingState();
    try {
      final response = await service.getAll(page);
      value = HomeSuccessState(response);
    } catch (error) {
      value = HomeErrorState(error.toString());
    }
  }
}
