import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/character_controller.dart';
import '../widgets/character_card.dart';
import '../widgets/app_header.dart';

class CharacterListView extends StatelessWidget {
  const CharacterListView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CharacterController>(context);

    return Scaffold(
      appBar: const AppHeader(style: AppHeaderStyle.home),
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.only(bottom: 16, top: 8),
              itemCount: controller.characters.length,
              itemBuilder: (context, index) {
                final character = controller.characters[index];
                return CharacterCard(character: character);
              },
            ),
    );
  }
}
