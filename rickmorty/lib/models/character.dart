class Character {
  final int id;
  final String name;
  final String image;
  final String status;
  final String species;
  final String locationName;
  final String firstEpisodeUrl;

  Character({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.species,
    required this.locationName,
    required this.firstEpisodeUrl,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      status: json['status'],
      species: json['species'],
      locationName: json['location']?['name'] ?? 'Unknown',
      firstEpisodeUrl: (json['episode'] as List).isNotEmpty
          ? json['episode'][0]
          : 'Unknown',
    );
  }
}
