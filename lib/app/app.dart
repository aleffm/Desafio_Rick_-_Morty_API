import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/characters/presentation/screens/loading_screen.dart';
import '../features/characters/presentation/screens/character_list_screen.dart';
import '../features/characters/presentation/screens/character_detail_screen.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Desafio Rick & Morty',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        fontFamily: 'Roboto',
      ),
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'loading',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/characters',
      name: 'characterList',
      builder: (context, state) => const CharacterListScreen(),
    ),
    GoRoute(
      path: '/characters/:id',
      name: 'characterDetail',
      builder: (context, state) {
        final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
        return CharacterDetailScreen(characterId: id);
      },
    ),
  ],
);
