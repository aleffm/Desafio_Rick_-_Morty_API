import 'dart:async';
import 'package:flutter/material.dart';

class CharacterSearchBar extends StatefulWidget {
  final ValueChanged<String> onSearch;

  const CharacterSearchBar({super.key, required this.onSearch});

  @override
  State<CharacterSearchBar> createState() => _CharacterSearchBarState();
}

class _CharacterSearchBarState extends State<CharacterSearchBar> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  void _onTextChanged(String text) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onSearch(text);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: const InputDecoration(
        hintText: 'Buscar personagem...',
        prefixIcon: Icon(Icons.search_rounded),
        border: OutlineInputBorder(),
      ),
      onChanged: _onTextChanged,
    );
  }
}
