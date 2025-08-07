import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/character_controller.dart';
import '../widgets/character_card.dart';

class CharacterListView extends StatelessWidget {
  const CharacterListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CharacterController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick and Morty API"),
        centerTitle: true,
      ),
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.characters.length,
              itemBuilder: (context, index) {
                final character = controller.characters[index];
                return CharacterCard(character: character);
              },
            ),
    );
  }
}
