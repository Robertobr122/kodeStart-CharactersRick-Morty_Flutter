import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/character_controller.dart';

class SearchDrawer extends StatefulWidget {
  const SearchDrawer({super.key});

  @override
  State<SearchDrawer> createState() => _SearchDrawerState();
}

class _SearchDrawerState extends State<SearchDrawer> {
  final _text = TextEditingController();

  @override
  void initState() {
    super.initState();
    final q = context.read<CharacterController>().currentQuery;
    if (q != null && q.isNotEmpty) _text.text = q;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1C1B1F),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Search character',
                style: TextStyle(
                  fontFamily: 'Lato', fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _text,
                style: const TextStyle(color: Colors.white),
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Type a name (e.g. Rick)',
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: const Color(0xFF2A2A2A),
                  prefixIcon: const Icon(Icons.search, color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (_) => _submit(),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.search),
                label: const Text('Search'),
              ),
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: _clear,
                icon: const Icon(Icons.clear),
                label: const Text('Clear search'),
              ),
              const Spacer(),
              const Text(
                'Tip: partial names are allowed.\nExample: "ric" → Rick, Eric...',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    final q = _text.text.trim();
    await context.read<CharacterController>().searchByName(q);
    if (mounted) Navigator.of(context).maybePop();
  }

  Future<void> _clear() async {
    _text.clear();
    await context.read<CharacterController>().clearSearch();
    if (mounted) Navigator.of(context).maybePop();
  }
}
