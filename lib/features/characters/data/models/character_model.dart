class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String image;
  final String origin;
  final String location;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    required this.origin,
    required this.location,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      image: json['image'],
      origin: json['origin']['name'],
      location: json['location']['name'],
    );
  }

  static Character empty() => Character(
    id: 0,
    name: '',
    status: '',
    species: '',
    image: '',
    origin: '',
    location: '',
  );
}
