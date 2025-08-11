import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/character_controller.dart';
import '../widgets/character_card.dart';
import '../widgets/app_header.dart';
import '../widgets/search_drawer.dart';

class CharacterListView extends StatelessWidget {
  const CharacterListView({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.watch<CharacterController>();
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: const SearchDrawer(),

      appBar: AppHeader(
        leftIcon: Icons.menu,
        onLeftTap: () => scaffoldKey.currentState?.openDrawer(),
        rightImageAsset: 'assets/images/icon.png',
        onRightTap: () {},
      ),

      body: c.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              itemCount: c.characters.length,
              separatorBuilder: (_, __) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                final character = c.characters[index];
                return Center(child: CharacterCard(character: character));
              },
            ),

      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: (c.currentPage > 1 && !c.isLoading)
                    ? c.prevPage
                    : null,
                icon: const Icon(Icons.chevron_left),
                label: const Text('Previous'),
              ),
              Text(
                'Page ${c.currentPage} of ${c.totalPages}',
                style: const TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ElevatedButton.icon(
                onPressed: (c.currentPage < c.totalPages && !c.isLoading)
                    ? c.nextPage
                    : null,
                icon: const Icon(Icons.chevron_right),
                label: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
