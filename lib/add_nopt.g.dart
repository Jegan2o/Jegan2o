// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_nopt.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotepadAdapter extends TypeAdapter<Notepad> {
  @override
  final int typeId = 1;

  @override
  Notepad read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Notepad(
      note: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Notepad obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotepadAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
