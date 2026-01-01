import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:animes_hub/features/tracking/data/models/anime_hive_model.dart';
import 'package:animes_hub/features/tracking/domain/entities/tracking_status.dart';

part 'tracking_repository.g.dart';

class TrackingRepository {
  final Box<AnimeHiveModel> _box;

  TrackingRepository(this._box);

  Future<void> saveOrUpdate({
    required int malId,
    required String title,
    String? imageUrl,
    required TrackingStatus status,
  }) async {
    // Verificar se já existe (update) ou criar novo
    // Como malId é único, podemos usar ele como key ou buscar antes.
    // Hive keys padrão são dinâmicas, mas podemos forçar malId como key se quisermos.
    // Para simplificar migração e query, vamos buscar pelo malId nos values.

    // Check if exists
    final existingKey = _getKeyByMalId(malId);

    final item = AnimeHiveModel()
      ..malId = malId
      ..title = title
      ..imageUrl = imageUrl
      ..status = status
      ..updatedAt = DateTime.now();

    if (existingKey != null) {
      await _box.put(existingKey, item);
    } else {
      await _box.add(item);
    }
  }

  Future<void> delete(int malId) async {
    final key = _getKeyByMalId(malId);
    if (key != null) {
      await _box.delete(key);
    }
  }

  Stream<TrackingStatus?> watchStatus(int malId) async* {
    // Emitir valor atual imediatamente
    yield _getStatusSync(malId);

    // Escutar mudanças na box
    await for (final _ in _box.watch()) {
      yield _getStatusSync(malId);
    }
  }

  TrackingStatus? _getStatusSync(int malId) {
    try {
      final item = _box.values.firstWhere((e) => e.malId == malId);
      return item.status;
    } catch (_) {
      return null;
    }
  }

  dynamic _getKeyByMalId(int malId) {
    try {
      final item = _box.values.firstWhere((e) => e.malId == malId);
      return item.key;
    } catch (_) {
      return null;
    }
  }

  List<AnimeHiveModel> getByStatus(TrackingStatus status) {
    return _box.values.where((e) => e.status == status).toList()
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
  }
}

@Riverpod(keepAlive: true)
Future<TrackingRepository> trackingRepository(TrackingRepositoryRef ref) async {
  // Hive box deve ser aberta no main, mas podemos garantir aqui.
  // Assumindo 'tracking_box' aberta no main.
  final box = Hive.box<AnimeHiveModel>('tracking_box');
  return TrackingRepository(box);
}
