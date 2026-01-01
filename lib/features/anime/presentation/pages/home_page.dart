import 'package:animes_hub/features/anime/presentation/providers/anime_providers.dart';
import 'package:animes_hub/features/anime/presentation/widgets/anime_grid.dart';
import 'package:animes_hub/features/anime/presentation/pages/search_page.dart';
import 'package:animes_hub/features/tracking/presentation/pages/my_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAnimes = ref.watch(seasonalAnimesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimesHUB Now'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.Bookmarks_outlined),
            tooltip: 'Minha Lista',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyListPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ),
        ],
      ),
      body: asyncAnimes.when(
        data: (animes) {
          if (animes.isEmpty) {
            return const Center(child: Text('Nenhum anime encontrado.'));
          }
          return AnimeGrid(animes: animes);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('Erro: $err', textAlign: TextAlign.center),
              ElevatedButton(
                onPressed: () => ref.refresh(seasonalAnimesProvider),
                child: const Text('Tentar novamente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
