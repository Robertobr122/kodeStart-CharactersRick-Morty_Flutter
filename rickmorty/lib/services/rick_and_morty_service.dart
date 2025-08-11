import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/character.dart';

class RickAndMortyService {
  static const _base = 'https://rickandmortyapi.com/api';

  Future<List<Character>> fetchCharacters({String? name}) async {
    final uri = (name == null || name.trim().isEmpty)
        ? Uri.parse('$_base/character')
        : Uri.parse('$_base/character/?name=${Uri.encodeQueryComponent(name)}');

    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      final results = (data['results'] as List).cast<Map<String, dynamic>>();
      return results.map((e) => Character.fromJson(e)).toList();
    }

    if (res.statusCode == 404) return <Character>[];
    throw Exception('Erro ${res.statusCode} ao buscar personagens');
  }
}
