// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactsAdapter extends TypeAdapter<Contacts> {
  @override
  final int typeId = 0;

  @override
  Contacts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Contacts(
      displayName: fields[0] as String?,
      givenName: fields[1] as String?,
      middleName: fields[2] as String?,
      prefix: fields[3] as String?,
      suffix: fields[4] as String?,
      familyName: fields[5] as String?,
      company: fields[6] as String?,
      jobTitle: fields[7] as String?,
      emails: fields[8] as String?,
      phones: fields[9] as String?,
      postalAddresses: fields[10] as String?,
      avatar: fields[11] as Uint8List?,
    );
  }

  @override
  void write(BinaryWriter writer, Contacts obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.displayName)
      ..writeByte(1)
      ..write(obj.givenName)
      ..writeByte(2)
      ..write(obj.middleName)
      ..writeByte(3)
      ..write(obj.prefix)
      ..writeByte(4)
      ..write(obj.suffix)
      ..writeByte(5)
      ..write(obj.familyName)
      ..writeByte(6)
      ..write(obj.company)
      ..writeByte(7)
      ..write(obj.jobTitle)
      ..writeByte(8)
      ..write(obj.emails)
      ..writeByte(9)
      ..write(obj.phones)
      ..writeByte(10)
      ..write(obj.postalAddresses)
      ..writeByte(11)
      ..write(obj.avatar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
