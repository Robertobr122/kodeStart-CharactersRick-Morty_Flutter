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
      appBar: AppHeader(
        leftIcon: Icons.menu,
        onLeftTap: () {}, 
        rightIcon: Icons.account_circle_outlined,
        onRightTap: () {}, 
      ),
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.only(bottom: 16, top: 8),
              itemCount: controller.characters.length,
              itemBuilder: (_, i) =>
                  CharacterCard(character: controller.characters[i]),
            ),
    );
  }
}
