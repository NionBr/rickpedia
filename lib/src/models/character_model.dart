class CharacterModel {
  final int id;
  final String name;
  final String species;
  final String status;
  final String gender;
  final String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.species,
    required this.status,
    required this.gender,
    required this.image,
  });

  factory CharacterModel.fromJson(dynamic map) {
    return CharacterModel(
      id: map['id'],
      name: map['name'],
      species: map['species'],
      status: map['status'],
      gender: map['gender'],
      image: map['image'],
    );
  }
}
