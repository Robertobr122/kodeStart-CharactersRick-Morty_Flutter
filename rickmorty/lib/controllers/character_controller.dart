import 'package:flutter/material.dart';
import '../models/character.dart';
import '../services/rick_and_morty_service.dart';

class CharacterController extends ChangeNotifier {
  final RickAndMortyService _service = RickAndMortyService();
  List<Character> characters = [];
  bool isLoading = true;

  CharacterController() {
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    try {
      debugPrint('Buscando personagens...');
      characters = await _service.fetchCharacters();
      debugPrint('Personagens carregados: ${characters.length}');
    } catch (e) {
      debugPrint(
        'Erro ao buscar personagens: $e , por falta de internet ou erro inesperado',
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
