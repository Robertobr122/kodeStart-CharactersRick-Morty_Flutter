import 'package:flutter/material.dart';
import '../models/character.dart';
import '../services/rick_and_morty_service.dart';

class CharacterController extends ChangeNotifier {
  final RickAndMortyService _service = RickAndMortyService();
  List<Character> characters = [];
  bool isLoading = true;

  String? _currentQuery;

  CharacterController() {
    fetchCharacters();
  }

  Future<void> fetchCharacters({String? name}) async {
    try {
      isLoading = true;
      notifyListeners();
      debugPrint('Buscando personagens...');

      characters = await _service.fetchCharacters(name: name);
      _currentQuery = name;
      debugPrint('Personagens carregados: ${characters.length}');
    } catch (e) {
      debugPrint(
        'Erro ao buscar personagens: $e , por falta de internet ou erro inesperado',
      );
      characters = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchByName(String query) async {
    await fetchCharacters(name: query.trim());
  }

  Future<void> clearSearch() async {
    await fetchCharacters(name: null);
  }

  String? get currentQuery => _currentQuery;
}
