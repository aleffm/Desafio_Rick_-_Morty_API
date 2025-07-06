import 'package:go_router/go_router.dart';
import '../../features/characters/presentation/screens/loading_screen.dart';
import '../../features/characters/presentation/screens/character_list_screen.dart';
import '../../features/characters/presentation/screens/character_detail_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/characters',
      builder: (context, state) => const CharacterListScreen(),
    ),
    GoRoute(
      path: '/characters/:id',
      builder: (context, state) {
        final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
        return CharacterDetailScreen(characterId: id);
      },
    ),
  ],
);
