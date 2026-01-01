import 'package:animes_hub/features/anime/domain/entities/anime.dart';
import 'package:animes_hub/features/anime/data/repositories/anime_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_content_providers.g.dart';

@riverpod
Future<List<Anime>> topAnimes(TopAnimesRef ref) {
  return ref.watch(animeRepositoryProvider).getTopAnimes();
}

@riverpod
Future<List<Anime>> upcomingAnimes(UpcomingAnimesRef ref) {
  return ref.watch(animeRepositoryProvider).getUpcomingAnimes();
}
