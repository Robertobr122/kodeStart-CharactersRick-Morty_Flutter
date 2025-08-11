import 'package:flutter/material.dart';
import '../models/character.dart';
import '../services/rick_and_morty_service.dart';

class CharacterController extends ChangeNotifier {
  final RickAndMortyService _service = RickAndMortyService();

  List<Character> characters = [];
  bool isLoading = true;

  int currentPage = 1;
  int totalPages = 1;

  String? _currentQuery;

  CharacterController() {
    fetchCharacters();
  }

  Future<void> fetchCharacters({String? name, int page = 1}) async {
    try {
      isLoading = true;
      notifyListeners();

      _currentQuery = (name != null && name.trim().isNotEmpty)
          ? name.trim()
          : null;
      currentPage = page;

      debugPrint(
        'Buscando personagens... (page=$currentPage, q=$_currentQuery)',
      );

      final pageData = await _service.fetchCharacters(
        name: _currentQuery,
        page: currentPage,
      );
      characters = pageData.results;
      totalPages = pageData.pages == 0 ? 1 : pageData.pages;

      debugPrint(
        'Personagens carregados: ${characters.length} (pages=$totalPages)',
      );
    } catch (e) {
      debugPrint(
        'Erro ao buscar personagens: $e , por falta de internet ou erro inesperado',
      );
      characters = [];
      totalPages = 1;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> nextPage() async {
    if (currentPage < totalPages) {
      await fetchCharacters(name: _currentQuery, page: currentPage + 1);
    }
  }

  Future<void> prevPage() async {
    if (currentPage > 1) {
      await fetchCharacters(name: _currentQuery, page: currentPage - 1);
    }
  }

  Future<void> searchByName(String query) async {
    await fetchCharacters(name: query, page: 1);
  }

  Future<void> clearSearch() async {
    await fetchCharacters(name: null, page: 1);
  }

  String? get currentQuery => _currentQuery;
}
