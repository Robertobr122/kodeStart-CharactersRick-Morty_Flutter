import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/character_controller.dart';
import 'views/character_list_view.dart';

void main() {
  runApp(const RickAndMortyApp());
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CharacterController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick and Morty',
        theme: ThemeData.dark(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: const Color(0xFF0B0B0B),
          textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Lato'),
        ),
        home: const CharacterListView(),
      ),
    );
  }
}
