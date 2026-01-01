import 'package:animes_hub/features/anime/domain/entities/anime.dart';
import 'package:animes_hub/features/anime/presentation/providers/anime_providers.dart';
import 'package:animes_hub/features/anime/presentation/providers/home_content_providers.dart';
import 'package:animes_hub/features/anime/presentation/widgets/anime_section_list.dart';
import 'package:animes_hub/features/anime/presentation/widgets/hero_banner.dart';
import 'package:animes_hub/features/anime/presentation/pages/search_page.dart';
import 'package:animes_hub/features/auth/presentation/providers/auth_providers.dart';
import 'package:animes_hub/features/tracking/domain/entities/tracking_status.dart';
import 'package:animes_hub/features/tracking/presentation/pages/my_list_page.dart';
import 'package:animes_hub/features/tracking/presentation/providers/tracking_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Assistindo os múltiplos providers
    final seasonalAsync = ref.watch(seasonalAnimesProvider);
    final topAsync = ref.watch(topAnimesProvider);
    final upcomingAsync = ref.watch(upcomingAnimesProvider);
    final watchingAsync = ref.watch(myListProvider(TrackingStatus.watching));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'ANIMESHUB',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 3,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.8),
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
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: () async {
              final authRepo = ref.read(authRepositoryProvider);
              await authRepo.signOut();
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, '/');
              }
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.refresh(seasonalAnimesProvider.future);
          await ref.refresh(topAnimesProvider.future);
          await ref.refresh(upcomingAnimesProvider.future);
          await ref.refresh(myListProvider(TrackingStatus.watching).future);
        },
        child: CustomScrollView(
          slivers: [
            // Hero Banner (Featured from TOP or Seasonal)
            SliverToBoxAdapter(
              child: topAsync.when(
                data: (list) => list.isNotEmpty
                    ? HeroBanner(anime: list.first)
                    : const SizedBox(height: 400),
                loading: () => Container(
                  height: 400,
                  color: Colors.black,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                error: (_, __) => const SizedBox(height: 400),
              ),
            ),

            // Seção: Continuar Assistindo (Se tiver itens)
            SliverToBoxAdapter(
              child: watchingAsync.when(
                data: (list) {
                  if (list.isEmpty) return const SizedBox.shrink();
                  // Converter HiveModel para Entity Anime
                  final animeList = list
                      .map((m) => Anime(
                            malId: m.malId,
                            title: m.title,
                            imageUrl: m.imageUrl,
                            largeImageUrl: m
                                .imageUrl, // Hive model não salva a large, usa a mesma
                            streamingLinks: [],
                            genres: [],
                          ))
                      .toList();

                  return AnimeSectionList(
                    title: 'Continuar Assistindo',
                    animes: animeList,
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ),

            // Seção: Lançamentos da Temporada
            SliverToBoxAdapter(
              child: seasonalAsync.when(
                data: (list) => AnimeSectionList(
                  title: 'Temporada Atual',
                  animes: list,
                ),
                loading: () => const _SectionLoadingPlaceholder(),
                error: (err, _) => Center(child: Text('Erro: $err')),
              ),
            ),

            // Seção: Mais Populares
            SliverToBoxAdapter(
              child: topAsync.when(
                data: (list) => AnimeSectionList(
                  title: 'Em Alta',
                  animes:
                      list.skip(1).toList(), // Pula o primeiro que está no Hero
                ),
                loading: () => const _SectionLoadingPlaceholder(),
                error: (err, _) => const SizedBox.shrink(),
              ),
            ),

            // Seção: Próximos Lançamentos
            SliverToBoxAdapter(
              child: upcomingAsync.when(
                data: (list) => AnimeSectionList(
                  title: 'Em Breve',
                  animes: list,
                ),
                loading: () => const _SectionLoadingPlaceholder(),
                error: (err, _) => const SizedBox.shrink(),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }
}

class _SectionLoadingPlaceholder extends StatelessWidget {
  const _SectionLoadingPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(width: 150, height: 20, color: Colors.grey[900]),
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Container(
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
