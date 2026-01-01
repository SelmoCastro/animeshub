// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeHiveModelAdapter extends TypeAdapter<AnimeHiveModel> {
  @override
  final int typeId = 0;

  @override
  AnimeHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimeHiveModel()
      ..malId = fields[0] as int
      ..title = fields[1] as String
      ..imageUrl = fields[2] as String?
      ..status = fields[3] as TrackingStatus
      ..updatedAt = fields[4] as DateTime;
  }

  @override
  void write(BinaryWriter writer, AnimeHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.malId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
