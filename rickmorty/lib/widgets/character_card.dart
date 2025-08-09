import 'package:flutter/material.dart';
import '../models/character.dart';
import '../views/character_detail_view.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CharacterDetailView(character: character),
          ),
        );
      },
      child: SizedBox(
        width: 320,
        height: 160,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                character.image,
                width: 320,
                height: 160,
                fit: BoxFit.cover,
                loadingBuilder: (c, ch, p) => p == null
                    ? ch
                    : const Center(child: CircularProgressIndicator()),
                errorBuilder: (_, __, ___) => Container(
                  color: const Color(0xFF2A2A2A),
                  alignment: Alignment.center,
                  child: const Icon(Icons.broken_image, color: Colors.white54),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 40, // MOD: altura da tag = 40
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(
                    135,
                    161,
                    250,
                    1,
                  ), // TODO: ajuste para o HEX exato do Figma, se diferente
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      16,
                    ), // MOD: cantos inferiores 16
                    bottomRight: Radius.circular(
                      16,
                    ), // MOD: cantos inferiores 16
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.centerLeft,
                child: Text(
                  character.name.toUpperCase(), // MOD: caps como no protótipo
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Lato', // MOD: fonte Lato
                    fontSize: 14.5, // MOD: tamanho 14.5
                    fontWeight: FontWeight.w900, // MOD: peso 900
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
