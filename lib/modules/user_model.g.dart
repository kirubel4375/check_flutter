// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserSignUpModelAdapter extends TypeAdapter<UserSignUpModel> {
  @override
  final int typeId = 3;

  @override
  UserSignUpModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserSignUpModel(
      id: fields[4] as String,
      email: fields[9] as String,
      first_name: fields[6] as String,
      last_name: fields[7] as String,
      phone: fields[8] as String,
      profile_picture: fields[5] as String,
      username: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserSignUpModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.profile_picture)
      ..writeByte(6)
      ..write(obj.first_name)
      ..writeByte(7)
      ..write(obj.last_name)
      ..writeByte(8)
      ..write(obj.phone)
      ..writeByte(9)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserSignUpModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
