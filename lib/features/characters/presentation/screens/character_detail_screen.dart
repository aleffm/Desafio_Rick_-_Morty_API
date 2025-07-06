import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../application/character_provider.dart';
import '../../data/models/character_model.dart';

class CharacterDetailScreen extends ConsumerWidget {
  final int characterId;

  const CharacterDetailScreen({super.key, required this.characterId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characters = ref.watch(characterProvider);
    final character = characters.firstWhere(
          (c) => c.id == characterId,
      orElse: () => Character.empty(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do Personagem"),
        centerTitle: true,
      ),
      body: character.id == 0
          ? const Center(child: Text("Personagem não encontrado."))
          : SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Hero(
              tag: 'character-${character.id}',
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    character.image,
                    height: 250,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              character.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _InfoRow(icon: Icons.favorite, label: "Status", value: character.status),
                  const SizedBox(height: 12),
                  _InfoRow(icon: Icons.pets, label: "Espécie", value: character.species),
                  const SizedBox(height: 12),
                  _InfoRow(icon: Icons.public, label: "Origem", value: character.origin),
                  const SizedBox(height: 12),
                  _InfoRow(icon: Icons.location_on, label: "Localização", value: character.location),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[700], size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style.copyWith(fontSize: 16),
              children: [
                TextSpan(
                  text: "$label: ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
