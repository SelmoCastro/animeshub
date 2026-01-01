import 'package:animes_hub/features/anime/domain/entities/anime_streaming.dart';

class Anime {
  final int malId;
  final String title;
  final String imageUrl;
  final String largeImageUrl;
  final double? score;
  final String? synopsis;
  final List<String> genres;
  final String? trailerUrl;
  final List<AnimeStreaming> streamingLinks;

  const Anime({
    required this.malId,
    required this.title,
    required this.imageUrl,
    required this.largeImageUrl,
    this.score,
    this.synopsis,
    required this.genres,
    this.trailerUrl,
    required this.streamingLinks,
  });
}
