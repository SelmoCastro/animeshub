import 'package:animes_hub/features/anime/data/repositories/anime_repository_impl.dart';
import 'package:animes_hub/features/anime/domain/entities/anime.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'anime_providers.g.dart';

@riverpod
Future<List<Anime>> seasonalAnimes(SeasonalAnimesRef ref) {
  final repository = ref.watch(animeRepositoryProvider);
  return repository.getSeasonalAnimes();
}

@riverpod
Future<List<Anime>> searchAnimes(SearchAnimesRef ref, String query) {
  final repository = ref.watch(animeRepositoryProvider);
  // Debouncing pode ser tratado aqui ou no controller da UI
  return repository.searchAnimes(query);
}
