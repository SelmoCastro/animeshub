import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:animes_hub/features/tracking/domain/entities/tracking_status.dart';
import 'package:animes_hub/features/tracking/domain/repositories/tracking_repository.dart';
import 'package:animes_hub/features/tracking/data/models/anime_hive_model.dart';

part 'tracking_providers.g.dart';

@riverpod
Stream<TrackingStatus?> trackingStatus(
    TrackingStatusRef ref, int malId) async* {
  final repository = await ref.watch(trackingRepositoryProvider.future);
  yield* repository.watchStatus(malId);
}

@riverpod
Future<List<AnimeHiveModel>> myList(
    MyListRef ref, TrackingStatus status) async {
  final repository = await ref.watch(trackingRepositoryProvider.future);
  return repository.getByStatus(status);
}
