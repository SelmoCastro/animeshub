class Anime {
  final int malId;
  final String title;
  final String imageUrl;
  final String largeImageUrl;
  final double? score;
  final String? synopsis;
  final List<String> genres;
  final String? trailerUrl;

  const Anime({
    required this.malId,
    required this.title,
    required this.imageUrl,
    required this.largeImageUrl,
    this.score,
    this.synopsis,
    required this.genres,
    this.trailerUrl,
  });
}
