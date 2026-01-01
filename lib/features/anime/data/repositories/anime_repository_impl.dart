import 'package:animes_hub/features/anime/data/datasources/anime_remote_datasource.dart';
import 'package:animes_hub/features/anime/domain/entities/anime.dart';
import 'package:animes_hub/features/anime/domain/repositories/anime_repository.dart';
import 'package:animes_hub/features/anime/domain/entities/anime_streaming.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'anime_repository_impl.g.dart';

@riverpod
AnimeRepository animeRepository(AnimeRepositoryRef ref) {
  return AnimeRepositoryImpl(ref.watch(animeRemoteDataSourceProvider));
}

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemoteDataSource _dataSource;

  AnimeRepositoryImpl(this._dataSource);

  @override
  Future<List<Anime>> getTopAnimes() async {
    final models = await _dataSource.getTopAnimes();
    return _mapModelsToEntities(models);
  }

  @override
  Future<List<Anime>> getUpcomingAnimes() async {
    final models = await _dataSource.getUpcomingAnimes();
    return _mapModelsToEntities(models);
  }

  @override
  Future<List<Anime>> getSeasonalAnimes() async {
    final models = await _dataSource.getSeasonalAnimes();
    return _mapModelsToEntities(models);
  }

  List<Anime> _mapModelsToEntities(List models) {
    return models
        .map((model) => Anime(
              malId: model.malId,
              title: model.title,
              imageUrl: model.images.jpg.imageUrl ?? '',
              largeImageUrl: model.images.jpg.largeImageUrl ?? '',
              score: model.score,
              synopsis: model.synopsis,
              genres: model.genres.map((g) => g.name).toList(),
              trailerUrl: model.trailer?.url,
              streamingLinks: model.streaming
                  .map((s) => AnimeStreaming(name: s.name, url: s.url))
                  .toList(),
            ))
        .toList();
  }

  @override
  Future<List<Anime>> searchAnimes(String query) async {
    final models = await _dataSource.searchAnimes(query);
    return _mapModelsToEntities(models);
  }
}
