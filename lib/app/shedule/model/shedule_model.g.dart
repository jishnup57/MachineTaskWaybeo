// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shedule_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SheduleModelAdapter extends TypeAdapter<SheduleModel> {
  @override
  final int typeId = 1;

  @override
  SheduleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SheduleModel(
      id: fields[0] as int,
      day: fields[1] as String,
      date: fields[2] as String,
      compleatlyBooked: fields[3] as bool,
      morning: fields[4] as bool,
      afternoon: fields[5] as bool,
      evening: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SheduleModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.day)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.compleatlyBooked)
      ..writeByte(4)
      ..write(obj.morning)
      ..writeByte(5)
      ..write(obj.afternoon)
      ..writeByte(6)
      ..write(obj.evening);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SheduleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
