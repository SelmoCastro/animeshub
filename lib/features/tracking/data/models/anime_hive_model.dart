import 'package:hive/hive.dart';
import 'package:animes_hub/features/tracking/domain/entities/tracking_status.dart';

part 'anime_hive_model.g.dart';

@HiveType(typeId: 0)
class AnimeHiveModel extends HiveObject {
  @HiveField(0)
  late int malId;

  @HiveField(1)
  late String title;

  @HiveField(2)
  String? imageUrl;

  @HiveField(3)
  late TrackingStatus status;

  @HiveField(4)
  late DateTime updatedAt;
}
