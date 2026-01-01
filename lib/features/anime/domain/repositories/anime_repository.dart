import '../entities/anime.dart';

abstract class AnimeRepository {
  Future<List<Anime>> getSeasonalAnimes();
  Future<List<Anime>> getTopAnimes();
  Future<List<Anime>> getUpcomingAnimes();
  Future<List<Anime>> searchAnimes(String query);
}
