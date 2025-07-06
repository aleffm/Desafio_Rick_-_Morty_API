import 'package:flutter/material.dart';
import '../../data/models/character_model.dart';
import '../../application/character_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterDetailScreen extends ConsumerWidget {
  final int characterId;
  const CharacterDetailScreen({super.key, required this.characterId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final character = ref
        .watch(characterProvider)
        .firstWhere((char) => char.id == characterId);

    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(character.image),
            const SizedBox(height: 16),
            Text('Espécie: ${character.species}'),
            Text('Status: ${character.status}'),
            Text('Origem: ${character.origin}'),
            Text('Localização: ${character.location}'),
          ],
        ),
      ),
    );
  }
}
