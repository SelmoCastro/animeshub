import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:animes_hub/core/database/isar_provider.dart';
import 'package:animes_hub/features/tracking/data/models/anime_collection.dart';
import 'package:animes_hub/features/tracking/domain/entities/tracking_status.dart';

part 'tracking_repository.g.dart';

class TrackingRepository {
  final Isar _isar;

  TrackingRepository(this._isar);

  Future<void> saveOrUpdate({
    required int malId,
    required String title,
    String? imageUrl,
    required TrackingStatus status,
  }) async {
    final newItem = AnimeCollection()
      ..malId = malId
      ..title = title
      ..imageUrl = imageUrl
      ..status = status
      ..updatedAt = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.animeCollections.putByMalId(newItem);
    });
  }

  Future<void> delete(int malId) async {
    await _isar.writeTxn(() async {
      await _isar.animeCollections.deleteByMalId(malId);
    });
  }

  Stream<TrackingStatus?> watchStatus(int malId) {
    return _isar.animeCollections
        .filter()
        .malIdEqualTo(malId)
        .watch(fireImmediately: true)
        .map((animes) => animes.isNotEmpty ? animes.first.status : null);
  }

  Future<List<AnimeCollection>> getByStatus(TrackingStatus status) async {
    return _isar.animeCollections
        .filter()
        .statusEqualTo(status)
        .sortByUpdatedAtDesc()
        .findAll();
  }
}

@Riverpod(keepAlive: true)
Future<TrackingRepository> trackingRepository(TrackingRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  return TrackingRepository(isar);
}
