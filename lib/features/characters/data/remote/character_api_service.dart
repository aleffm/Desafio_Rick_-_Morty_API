import 'package:dio/dio.dart';
import '../models/character_model.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/exceptions/api_exception.dart';

class CharacterApiService {
  final Dio _dio = Dio();

  Future<List<Character>> getCharacters({String? name}) async {
    try {
      final response = await _dio.get(
        AppConstants.characterEndpoint,
        queryParameters: name != null && name.isNotEmpty ? {'name': name} : null,
      );

      final results = response.data['results'] as List;
      return results.map((json) => Character.fromJson(json)).toList();
    } on DioException catch (e) {
      throw ApiException(e.message ?? 'Erro de rede', e.response?.statusCode);
    } catch (e) {
      throw ApiException('Erro inesperado: $e');
    }
  }
}
