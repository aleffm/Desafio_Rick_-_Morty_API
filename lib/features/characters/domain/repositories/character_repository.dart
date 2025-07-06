import '../../data/models/character_model.dart';
import '../../data/remote/character_api_service.dart';

class CharacterRepository {
  final CharacterApiService _apiService = CharacterApiService();

  Future<List<Character>> getAllCharacters({String? query}) async {
    return _apiService.getCharacters(name: query);
  }
}

