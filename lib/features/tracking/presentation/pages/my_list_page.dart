import 'package:animes_hub/features/anime/domain/entities/anime.dart';
import 'package:animes_hub/features/anime/presentation/widgets/anime_grid.dart';
import 'package:animes_hub/features/tracking/data/models/anime_collection.dart';
import 'package:animes_hub/features/tracking/domain/entities/tracking_status.dart';
import 'package:animes_hub/features/tracking/presentation/providers/tracking_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyListPage extends ConsumerWidget {
  const MyListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: TrackingStatus.values.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Minha Lista'),
          bottom: TabBar(
            isScrollable: true,
            tabs: TrackingStatus.values
                .map((status) => Tab(text: status.label))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: TrackingStatus.values.map((status) {
            return _AnimeListByStatus(status: status);
          }).toList(),
        ),
      ),
    );
  }
}

class _AnimeListByStatus extends ConsumerWidget {
  final TrackingStatus status;

  const _AnimeListByStatus({required this.status});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animeListAsync = ref.watch(myListProvider(status));

    return animeListAsync.when(
      data: (collectionList) {
        if (collectionList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.movie_filter_outlined,
                    size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  'Nenhum anime em "${status.label}"',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
          );
        }

        // Converter AnimeCollection para Anime (entidade de domínio) para reusar AnimeGrid
        // Nota: Como AnimeCollection tem menos campos, preenchemos o básico.
        // O ideal seria AnimeGrid aceitar uma interface comum ou ter um adapter.
        // Aqui faremos uma conversão simples.
        final animes = collectionList.map((item) {
          return Anime(
            malId: item.malId,
            title: item.title,
            imageUrl: item.imageUrl ?? '',
            largeImageUrl: item.imageUrl ?? '', // Fallback
            synopsis: null,
            score: null,
            trailerUrl: null,
            genres: [],
          );
        }).toList();

        return AnimeGrid(
          animes: animes,
          onRefresh: () async {
            return ref.refresh(myListProvider(status).future);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Erro: $err')),
    );
  }
}
