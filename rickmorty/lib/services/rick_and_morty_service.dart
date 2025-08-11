import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class CharactersPage {
  final List<Character> results;
  final int pages;
  final int count;
  CharactersPage({
    required this.results,
    required this.pages,
    required this.count,
  });
}

class RickAndMortyService {
  static const _base = 'https://rickandmortyapi.com/api';

  Future<CharactersPage> fetchCharacters({String? name, int page = 1}) async {
    final base = Uri.parse('$_base/character');
    final qp = <String, String>{'page': '$page'};
    if (name != null && name.trim().isNotEmpty) {
      qp['name'] = name.trim();
    }
    final uri = base.replace(queryParameters: qp);

    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      final info = data['info'] as Map<String, dynamic>;
      final pages = (info['pages'] as num).toInt();
      final count = (info['count'] as num).toInt();

      final results = (data['results'] as List).cast<Map<String, dynamic>>();
      final list = results.map((e) => Character.fromJson(e)).toList();

      return CharactersPage(results: list, pages: pages, count: count);
    }

    if (res.statusCode == 404) {
      return CharactersPage(results: <Character>[], pages: 0, count: 0);
    }

    throw Exception('Erro ${res.statusCode} ao buscar personagens');
  }
}
