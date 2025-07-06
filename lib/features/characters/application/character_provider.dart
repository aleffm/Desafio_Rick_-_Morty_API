import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/character_model.dart';
import '../domain/repositories/character_repository.dart';

final characterProvider =
StateNotifierProvider<CharacterNotifier, List<Character>>((ref) {
  return CharacterNotifier();
});

class CharacterNotifier extends StateNotifier<List<Character>> {
  CharacterNotifier() : super([]);

  final CharacterRepository _repository = CharacterRepository();

  Future<void> fetchCharacters({String? query}) async {
    try {
      final characters = await _repository.getAllCharacters(query: query);
      print("Personagens carregados: ${characters.length}");
      state = characters;
    } catch (e) {
      print("Erro ao carregar personagens: $e");
      state = [];
    }
  }

  // Pull-to-refresh
  Future<void> loadCharacters() async {
    await fetchCharacters();
  }
}
