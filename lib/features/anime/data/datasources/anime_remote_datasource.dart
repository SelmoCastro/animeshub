import 'package:animes_hub/core/network/dio_provider.dart';
import 'package:animes_hub/features/anime/data/models/anime_model.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'anime_remote_datasource.g.dart';

@riverpod
AnimeRemoteDataSource animeRemoteDataSource(AnimeRemoteDataSourceRef ref) {
  return AnimeRemoteDataSource(ref.watch(dioProvider));
}

class AnimeRemoteDataSource {
  final Dio _dio;

  AnimeRemoteDataSource(this._dio);

  Future<List<AnimeModel>> getSeasonalAnimes() async {
    final response = await _dio.get('/seasons/now');
    // API Jikan retorna 'data' como uma lista de animes
    final data = response.data['data'] as List;
    return data.map((e) => AnimeModel.fromJson(e)).toList();
  }

  Future<List<AnimeModel>> searchAnimes(String query) async {
    final response = await _dio.get('/anime', queryParameters: {'q': query});
    final data = response.data['data'] as List;
    return data.map((e) => AnimeModel.fromJson(e)).toList();
  }

  Future<List<AnimeModel>> getTopAnimes() async {
    final response = await _dio.get('/top/anime');
    final data = response.data['data'] as List;
    return data.map((e) => AnimeModel.fromJson(e)).toList();
  }

  Future<List<AnimeModel>> getUpcomingAnimes() async {
    final response = await _dio.get('/seasons/upcoming');
    final data = response.data['data'] as List;
    return data.map((e) => AnimeModel.fromJson(e)).toList();
  }
}
