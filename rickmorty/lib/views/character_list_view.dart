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

        rightImageAsset: 'assets/images/icon.png',
        onRightTap: () {},
      ),
      body: controller.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              itemCount: controller.characters.length,
              separatorBuilder: (_, __) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                final character = controller.characters[index];
                return Center(child: CharacterCard(character: character));
              },
            ),
    );
  }
}
