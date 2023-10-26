import 'package:myapp/src/interfaces/character_interface.dart';
import 'package:myapp/src/models/character_model.dart';
import 'package:uno/uno.dart';

class CharacterService implements CharacterInterface {
  final Uno uno;
  final url = 'https://rickandmortyapi.com/api/character/?page=';

  CharacterService(this.uno);

  @override
  Future<List<CharacterModel>> getAll(int page) async {
    final response = await uno.get(url + '$page');
    final data = response.data['results'] as List;
    final list = data.map((e) => CharacterModel.fromJson(e)).toList();
    return list;
  }
}
