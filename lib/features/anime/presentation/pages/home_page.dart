import 'dart:ui';
import 'package:animes_hub/core/widgets/main_layout.dart';
import 'package:animes_hub/features/anime/domain/entities/anime.dart';
import 'package:animes_hub/features/anime/presentation/providers/anime_providers.dart';
import 'package:animes_hub/features/anime/presentation/providers/home_content_providers.dart';
import 'package:animes_hub/features/anime/presentation/widgets/glowing_ornate_border.dart';
import 'package:animes_hub/features/anime/presentation/pages/search_page.dart';
import 'package:animes_hub/features/auth/presentation/providers/auth_providers.dart';
import 'package:animes_hub/features/tracking/domain/entities/tracking_status.dart';
import 'package:animes_hub/features/tracking/presentation/pages/my_list_page.dart';
import 'package:animes_hub/features/tracking/presentation/providers/tracking_providers.dart';
import 'package:animes_hub/features/anime/presentation/pages/details_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _tabIndex = 1;

  @override
  Widget build(BuildContext context) {
    final seasonalAsync = ref.watch(seasonalAnimesProvider);
    final topAsync = ref.watch(topAnimesProvider);
    final upcomingAsync = ref.watch(upcomingAnimesProvider);
    final watchingAsync = ref.watch(myListProvider(TrackingStatus.watching));

    return MainLayout(
      selectedIndex: 0,
      onDestinationSelected: (index) {
        if (index == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SearchPage()));
        } else if (index == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyListPage()));
        } else if (index == 4) {
          // Logout
          ref.read(authRepositoryProvider).signOut();
          Navigator.pushReplacementNamed(context, '/');
        }
      },
      child: RefreshIndicator(
        onRefresh: () async {
          await ref.refresh(seasonalAnimesProvider.future);
          await ref.refresh(topAnimesProvider.future);
          await ref.refresh(upcomingAnimesProvider.future);
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 32.0, bottom: 8.0),
                child: Text(
                  'AnimesHUB Now',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 4,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 450,
                child: topAsync.when(
                  data: (list) => list.isNotEmpty
                      ? _CentralCarousel(animes: list.take(10).toList())
                      : const SizedBox.shrink(),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (_, __) => const SizedBox.shrink(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildTab('Minha Lista', 0),
                      _buildTab('Upcoming', 1),
                      _buildTab('Assistindo', 2),
                      _buildTab('Finalizado', 3),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _buildSectionContent(_tabIndex == 0
                  ? seasonalAsync
                  : _tabIndex == 1
                      ? upcomingAsync
                      : _tabIndex == 2
                          ? watchingAsync
                          : topAsync),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String label, int index) {
    bool isSelected = _tabIndex == index;
    const neonPurple = Color(0xFFBB86FC);

    return GestureDetector(
      onTap: () => setState(() => _tabIndex = index),
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? neonPurple.withOpacity(0.15)
              : Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? neonPurple : Colors.white.withOpacity(0.1),
          ),
          boxShadow: isSelected
              ? [BoxShadow(color: neonPurple.withOpacity(0.3), blurRadius: 8)]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.4),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w300,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionContent(AsyncValue asyncValue) {
    return asyncValue.when(
      data: (list) {
        final List<Anime> animes = (list is List<Anime>)
            ? list
            : (list as List)
                .map((m) => Anime(
                      malId: m.malId,
                      title: m.title,
                      imageUrl: m.imageUrl ?? '',
                      largeImageUrl: m.imageUrl ?? '',
                      streamingLinks: [],
                      genres: [],
                    ))
                .toList();

        return ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withOpacity(0.05)),
              ),
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _tabIndex == 1
                        ? 'Upcoming Anime Releases'
                        : 'Animes Sugeridos',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios,
                      color: Colors.white.withOpacity(0.5), size: 14),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: animes.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (context, index) =>
                      _CompactAnimeCard(anime: animes[index]),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, __) => Center(
          child: Text('Erro ao carregar seção: $e',
              style: const TextStyle(color: Colors.white))),
    );
  }
}

class _CentralCarousel extends StatefulWidget {
  final List<Anime> animes;
  const _CentralCarousel({required this.animes});

  @override
  State<_CentralCarousel> createState() => _CentralCarouselState();
}

class _CentralCarouselState extends State<_CentralCarousel> {
  late PageController _controller;
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.6, initialPage: 0);
    _controller.addListener(() {
      setState(() => _currentPage = _controller.page!);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: widget.animes.length,
      itemBuilder: (context, index) {
        double relativePosition = index - _currentPage;
        double scale = 1 - (relativePosition.abs() * 0.2);
        double opacity = 1 - (relativePosition.abs() * 0.5);

        return Transform.scale(
          scale: scale.clamp(0.8, 1.0),
          child: Opacity(
            opacity: opacity.clamp(0.3, 1.0),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsPage(anime: widget.animes[index]))),
              child: _OrnateAnimeCard(
                  anime: widget.animes[index],
                  isCenter: relativePosition.abs() < 0.5),
            ),
          ),
        );
      },
    );
  }
}

class _OrnateAnimeCard extends StatelessWidget {
  final Anime anime;
  final bool isCenter;

  const _OrnateAnimeCard({required this.anime, required this.isCenter});

  @override
  Widget build(BuildContext context) {
    return GlowingOrnateBorder(
      isActive: isCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: anime.largeImageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(color: Colors.grey[900]),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                  stops: const [0.6, 1.0],
                ),
              ),
            ),
            if (isCenter)
              Positioned(
                bottom: 24,
                left: 16,
                right: 16,
                child: Column(
                  children: [
                    Text(
                      anime.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(color: Colors.black, blurRadius: 15)],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFBB86FC).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: const Color(0xFFBB86FC).withOpacity(0.5)),
                      ),
                      child: const Text('ASSISTIR AGORA',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _CompactAnimeCard extends StatelessWidget {
  final Anime anime;
  const _CompactAnimeCard({required this.anime});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => DetailsPage(anime: anime))),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.6),
                blurRadius: 8,
                offset: const Offset(0, 4))
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: anime.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: Colors.black),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.9)
                      ],
                    ),
                  ),
                  child: Text(
                    anime.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
