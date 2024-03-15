// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imc_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImcModelAdapter extends TypeAdapter<ImcModel> {
  @override
  final int typeId = 1;

  @override
  ImcModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImcModel(
      peso: fields[0] as int,
      altura: fields[1] as int,
      idade: fields[2] as int,
      imc: fields[3] as double,
      corImc: fields[4] as Color,
      date: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImcModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.peso)
      ..writeByte(1)
      ..write(obj.altura)
      ..writeByte(2)
      ..write(obj.idade)
      ..writeByte(3)
      ..write(obj.imc)
      ..writeByte(4)
      ..write(obj.corImc)
      ..writeByte(5)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImcModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
