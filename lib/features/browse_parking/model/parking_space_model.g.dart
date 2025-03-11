// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_space_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParkingSpaceAdapter extends TypeAdapter<ParkingSpace> {
  @override
  final int typeId = 1;

  @override
  ParkingSpace read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParkingSpace(
      id: fields[0] as String,
      ownerId: fields[1] as String,
      name: fields[2] as String,
      description: fields[3] as String,
      imageUrl: fields[4] as String,
      latitude: fields[5] as double,
      longitude: fields[6] as double,
      price: fields[7] as double,
      isAvailable: fields[8] as bool,
      createdAt: fields[9] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ParkingSpace obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.ownerId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.imageUrl)
      ..writeByte(5)
      ..write(obj.latitude)
      ..writeByte(6)
      ..write(obj.longitude)
      ..writeByte(7)
      ..write(obj.price)
      ..writeByte(8)
      ..write(obj.isAvailable)
      ..writeByte(9)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParkingSpaceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
