import 'package:animes_hub/features/anime/presentation/providers/anime_providers.dart';
import 'package:animes_hub/features/anime/presentation/widgets/anime_card.dart';
import 'package:animes_hub/features/anime/presentation/widgets/hero_banner.dart';
import 'package:animes_hub/features/anime/presentation/pages/details_page.dart';
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
      extendBodyBehindAppBar:
          true, // Permite que o corpo passe por trás da AppBar
      appBar: AppBar(
        title: const Text('AnimesHUB Now'),
        centerTitle: true,
        backgroundColor: Colors.transparent, // AppBar Transparente
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.transparent,
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmarks_outlined),
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

          final featuredAnime = animes.first;
          final otherAnimes = animes.skip(1).toList();

          return RefreshIndicator(
            onRefresh: () => ref.refresh(seasonalAnimesProvider.future),
            child: CustomScrollView(
              slivers: [
                // Hero Banner (Featured Anime)
                SliverToBoxAdapter(
                  child: HeroBanner(anime: featuredAnime),
                ),

                // Section Title
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Mais Lançamentos',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                    ),
                  ),
                ),

                // Grid
                SliverPadding(
                  padding: const EdgeInsets.all(12),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.70,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final anime = otherAnimes[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(anime: anime),
                              ),
                            );
                          },
                          child: AnimeCard(anime: anime),
                        );
                      },
                      childCount: otherAnimes.length,
                    ),
                  ),
                ),

                // Bottom Padding
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
              ],
            ),
          );
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
