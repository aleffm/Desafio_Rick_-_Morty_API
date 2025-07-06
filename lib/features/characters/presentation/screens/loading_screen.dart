import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/character_provider.dart';
import 'package:go_router/go_router.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({super.key});

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(characterProvider.notifier).fetchCharacters();
      if (!_navigated && mounted) {
        _navigated = true;
        context.go('/characters');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
