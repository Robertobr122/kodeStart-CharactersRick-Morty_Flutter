class Character {
  final int id;
  final String name;
  final String image;
  final String status;
  final String species;
  final String gender;
  final String origin;
  final String location;
  final String firstEpisode;

  Character({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.species,
    required this.gender,
    required this.origin,
    required this.location,
    required this.firstEpisode,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      origin: json['origin']['name'],
      location: json['location']['name'],
      firstEpisode: json['episode'].first,
    );
  }
}
