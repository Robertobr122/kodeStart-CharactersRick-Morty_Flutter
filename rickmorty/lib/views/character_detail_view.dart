import 'package:flutter/material.dart';
import '../models/character.dart';
import '../widgets/app_header.dart';

class CharacterDetailView extends StatelessWidget {
  final Character character;

  const CharacterDetailView({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(style: AppHeaderStyle.detail),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(character.image),
            ),
            const SizedBox(height: 16),
            _info('Nome', character.name),
            _info('Espécie', character.species),
            _info('Gênero', character.gender),
            _info('Status', character.status),
            _info('Origem', character.origin),
            _info('Última localização', character.location),
            _info(
              'Primeira aparição (URL)',
              character.firstEpisode,
            ), // depois trocamos pelo nome do episódio
          ],
        ),
      ),
    );
  }

  Widget _info(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
