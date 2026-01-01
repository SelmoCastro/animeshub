import 'package:hive/hive.dart';

part 'tracking_status.g.dart';

@HiveType(typeId: 1)
enum TrackingStatus {
  @HiveField(0)
  planning('Planejo Assistir'),
  @HiveField(1)
  watching('Assistindo'),
  @HiveField(2)
  completed('Finalizado'),
  @HiveField(3)
  dropped('Dropado');

  final String label;
  const TrackingStatus(this.label);
}
