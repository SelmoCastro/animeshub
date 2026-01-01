import 'package:isar/isar.dart';
import 'package:animes_hub/features/tracking/domain/entities/tracking_status.dart';

part 'anime_collection.g.dart';

@collection
class AnimeCollection {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late int malId;

  late String title;

  String? imageUrl;

  @enumerated
  late TrackingStatus status;

  late DateTime updatedAt;
}
