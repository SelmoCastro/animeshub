import '../entities/anime.dart';

abstract class AnimeRepository {
  Future<List<Anime>> getSeasonalAnimes();
  Future<List<Anime>> searchAnimes(String query);
}
