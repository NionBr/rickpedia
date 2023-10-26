import 'package:myapp/src/models/character_model.dart';

abstract class CharacterInterface {
  Future<List<CharacterModel>> getAll(int page);
}
