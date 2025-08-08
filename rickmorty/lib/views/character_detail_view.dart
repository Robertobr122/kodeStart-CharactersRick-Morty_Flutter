import 'package:flutter/material.dart';
import '../models/character.dart';

class CharacterDetailView extends StatelessWidget {
  final Character character;
  const CharacterDetailView({Key? key, required this.character})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(character.image),
            ),
            const SizedBox(height: 12),
            _buildInfoRow('Nome', character.name),
            _buildInfoRow('Espécie', character.species),
            _buildInfoRow("Gênero", character.gender),
            _buildInfoRow("Status", character.status),
            _buildInfoRow("Origem", character.origin),
            _buildInfoRow("Última Localização", character.location),
            _buildInfoRow("Primeira Aparição", character.firstEpisode),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
