import 'package:flutter/material.dart';
import 'controllers/character_controller.dart';
import 'views/character_list_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const RickAndMorty());
}

class RickAndMorty extends StatelessWidget {
  const RickAndMorty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CharacterController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick and Mo',
        theme: ThemeData.dark(useMaterial3: true),
        home: const CharacterListView(),
      ),
    );
  }
}
