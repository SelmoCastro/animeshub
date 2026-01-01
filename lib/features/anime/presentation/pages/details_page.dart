import 'package:animes_hub/features/anime/domain/entities/anime.dart';
import 'package:animes_hub/features/tracking/domain/entities/tracking_status.dart';
import 'package:animes_hub/features/tracking/domain/repositories/tracking_repository.dart';
import 'package:animes_hub/features/tracking/presentation/providers/tracking_providers.dart';
import 'package:animes_hub/features/stremio/data/stremio_service.dart';
import 'package:animes_hub/features/stremio/presentation/pages/stremio_player_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends ConsumerWidget {
  final Anime anime;

  const DetailsPage({super.key, required this.anime});

  Future<void> _launchTrailer(BuildContext context) async {
    if (anime.trailerUrl != null) {
      final uri = Uri.parse(anime.trailerUrl!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Não foi possível abrir o trailer')),
          );
        }
      }
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Trailer indisponível')),
        );
      }
    }
  }

  void _showStatusSelector(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adicionar à Minha Lista',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ...TrackingStatus.values.map(
              (status) => ListTile(
                leading: Icon(_getIconForStatus(status)),
                title: Text(status.label),
                onTap: () {
                  ref.read(trackingRepositoryProvider.future).then((repo) {
                    repo.saveOrUpdate(
                      malId: anime.malId,
                      title: anime.title,
                      imageUrl: anime.imageUrl,
                      status: status,
                    );
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Anime movido para ${status.label}')),
                  );
                },
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.delete_outline, color: Colors.red),
              title: const Text('Remover da lista',
                  style: TextStyle(color: Colors.red)),
              onTap: () {
                ref.read(trackingRepositoryProvider.future).then((repo) {
                  repo.delete(anime.malId);
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Anime removido da lista')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForStatus(TrackingStatus status) {
    switch (status) {
      case TrackingStatus.planning:
        return Icons.calendar_today;
      case TrackingStatus.watching:
        return Icons.play_circle_fill;
      case TrackingStatus.completed:
        return Icons.check_circle;
      case TrackingStatus.dropped:
        return Icons.remove_circle_outline;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStatusAsync = ref.watch(trackingStatusProvider(anime.malId));

    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showStatusSelector(context, ref),
        backgroundColor: const Color(0xFFBB86FC),
        foregroundColor: Colors.black,
        icon: currentStatusAsync.when(
          data: (status) => Icon(
            status != null ? _getIconForStatus(status) : Icons.add,
          ),
          loading: () => const SizedBox(
            width: 24,
            height: 24,
            child:
                CircularProgressIndicator(strokeWidth: 2, color: Colors.black),
          ),
          error: (_, __) => const Icon(Icons.error),
        ),
        label: currentStatusAsync.when(
          data: (status) => Text(status?.label ?? 'Adicionar à Lista',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          loading: () => const Text('Carregando...'),
          error: (_, __) => const Text('Erro'),
        ),
      ),
      body: Stack(
        children: [
          // Global Space Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
              child: Container(color: Colors.black.withOpacity(0.4))),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 400.0,
                floating: false,
                pinned: true,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    anime.title,
                    style: const TextStyle(
                      color: Colors.white,
                      shadows: [Shadow(color: Colors.black, blurRadius: 15)],
                    ),
                  ),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: anime.largeImageUrl.isNotEmpty
                            ? anime.largeImageUrl
                            : anime.imageUrl,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black87],
                            stops: [0.6, 1.0],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nota e Ações
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 28),
                          const SizedBox(width: 8),
                          Text(
                            anime.score != null
                                ? anime.score.toString()
                                : 'N/A',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const Spacer(),
                          if (anime.trailerUrl != null)
                            FilledButton.icon(
                              onPressed: () => _launchTrailer(context),
                              icon: const Icon(Icons.play_circle_outline),
                              label: const Text('Ver Trailer'),
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Gêneros
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: anime.genres
                            .map((genre) => Chip(
                                  label: Text(genre),
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .surfaceContainerHighest,
                                ))
                            .toList(),
                      ),
                      const SizedBox(height: 24),

                      // Sinopse
                      Text(
                        'Sinopse',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        anime.synopsis ?? 'Sem sinopse disponível.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              height: 1.5,
                              color: Colors.grey[300],
                            ),
                      ),
                      const SizedBox(height: 32),

                      // Stremio Integration
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6B42C1)
                              .withOpacity(0.2), // Stremio Purple-ish
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: const Color(0xFF6B42C1).withOpacity(0.5)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.rocket_launch,
                                    color: Color(0xFFBB86FC)),
                                const SizedBox(width: 8),
                                Text(
                                  'Servidor Privado (VPS)',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  // Check status
                                  final service = StremioService();
                                  final isOnline =
                                      await service.isServerOnline();

                                  if (context.mounted) {
                                    if (isOnline) {
                                      // Navigate to Player Page (Player Integrado)
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              StremioPlayerPage(
                                            title: anime.title,
                                            // In a real scenario, we would resolve the magnet link here.
                                            // For now, we open the player which handles the "Missing URL" state by offering the App fallback.
                                            streamUrl: null,
                                          ),
                                        ),
                                      );
                                    } else {
                                      // Fallback directly to App
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Servidor VPS Offline. Abrindo App Stremio...')),
                                      );
                                      service.launchStremioApp(anime.title);
                                    }
                                  }
                                },
                                icon: const Icon(Icons.play_arrow_rounded),
                                label:
                                    const Text('Assistir no Stremio Privado'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF6B42C1),
                                  foregroundColor: Colors.white,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Onde Assistir
                      Text(
                        'Onde Assistir',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),

                      if (anime.streamingLinks.isNotEmpty)
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: anime.streamingLinks.map((link) {
                            return ActionChip(
                              avatar: const Icon(Icons.tv, size: 16),
                              label: Text(link.name),
                              onPressed: () async {
                                final uri = Uri.parse(link.url);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri,
                                      mode: LaunchMode.externalApplication);
                                }
                              },
                            );
                          }).toList(),
                        )
                      else
                        Text(
                          'Nenhum serviço de streaming oficial listado.',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),

                      const SizedBox(height: 16),

                      // Busca Fallback
                      Text(
                        'Buscar Online',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _buildSearchButton(
                            context,
                            label: 'Google',
                            icon: Icons.search,
                            url: 'https://www.google.com/search?q=',
                            query: 'assistir ${anime.title} online',
                          ),
                          _buildSearchButton(
                            context,
                            label: 'Crunchyroll',
                            icon: Icons.play_circle_fill,
                            url: 'https://www.crunchyroll.com/search?q=',
                            query: anime.title,
                            color: const Color(
                                0xFFF47521), // Cor oficial Crunchyroll
                          ),
                          _buildSearchButton(
                            context,
                            label: 'Youtube',
                            icon: Icons.video_library,
                            url:
                                'https://www.youtube.com/results?search_query=',
                            query: '${anime.title} trailer review',
                            color: const Color(0xFFFF0000),
                          ),
                          _buildSearchButton(
                            context,
                            label: 'Netflix',
                            icon: Icons.movie_filter,
                            url: 'https://www.netflix.com/search?q=',
                            query: anime.title,
                            color: const Color(0xFFE50914),
                          ),
                        ],
                      ),

                      const SizedBox(height: 96), // Espaço para FAB
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required String url,
    required String query,
    Color? color,
  }) {
    return OutlinedButton.icon(
      icon: Icon(icon, size: 18, color: color),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(color: color?.withOpacity(0.5) ?? Colors.grey[700]!),
      ),
      onPressed: () async {
        final fullUrl = '$url${Uri.encodeComponent(query)}';
        final uri = Uri.parse(fullUrl);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
    );
  }
}
