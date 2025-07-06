import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/character_provider.dart';
import '../widgets/character_card.dart';
import '../widgets/search_bar.dart';

class CharacterListScreen extends ConsumerStatefulWidget {
  const CharacterListScreen({super.key});

  @override
  ConsumerState<CharacterListScreen> createState() =>
      _CharacterListScreenState();
}

class _CharacterListScreenState extends ConsumerState<CharacterListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(characterProvider.notifier).fetchCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    final characters = ref.watch(characterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Personagens')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CharacterSearchBar(
              onSearch: (query) {
                ref.read(characterProvider.notifier).fetchCharacters(query: query);
              },
            ),
          ),
          Expanded(
            child: characters.isEmpty
                ? const Center(child: Text("Nenhum personagem encontrado."))
                : GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: characters.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                final character = characters[index];
                return CharacterCard(character: character);
              },
            ),
          ),
        ],
      ),
    );
  }
}
