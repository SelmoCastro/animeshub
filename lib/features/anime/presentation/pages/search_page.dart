import 'package:animes_hub/features/anime/domain/entities/anime.dart';
import 'package:animes_hub/features/anime/presentation/providers/anime_providers.dart';
import 'package:animes_hub/features/anime/presentation/widgets/anime_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchSubmitted(String value) {
    if (value.trim().isNotEmpty) {
      setState(() {
        _query = value.trim();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncSearchResults = _query.isEmpty
        ? const AsyncValue<List<Anime>>.data([])
        : ref.watch(searchAnimesProvider(_query));

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Buscar animes...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: const TextStyle(color: Colors.white),
          textInputAction: TextInputAction.search,
          onSubmitted: _onSearchSubmitted,
        ),
      ),
      body: _query.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.search, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('Digite para buscar animes'),
                ],
              ),
            )
          : asyncSearchResults.when(
              data: (animes) {
                if (animes.isEmpty) {
                  return const Center(
                      child: Text('Nenhum resultado encontrado.'));
                }
                return AnimeGrid(animes: animes);
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Erro: $err')),
            ),
    );
  }
}
