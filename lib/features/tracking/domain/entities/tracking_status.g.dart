// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrackingStatusAdapter extends TypeAdapter<TrackingStatus> {
  @override
  final int typeId = 1;

  @override
  TrackingStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TrackingStatus.planning;
      case 1:
        return TrackingStatus.watching;
      case 2:
        return TrackingStatus.completed;
      case 3:
        return TrackingStatus.dropped;
      default:
        return TrackingStatus.planning;
    }
  }

  @override
  void write(BinaryWriter writer, TrackingStatus obj) {
    switch (obj) {
      case TrackingStatus.planning:
        writer.writeByte(0);
        break;
      case TrackingStatus.watching:
        writer.writeByte(1);
        break;
      case TrackingStatus.completed:
        writer.writeByte(2);
        break;
      case TrackingStatus.dropped:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrackingStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
