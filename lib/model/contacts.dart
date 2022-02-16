import 'dart:typed_data';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'contacts.g.dart';

@HiveType(typeId: 0)
class Contacts extends HiveObject{

  @HiveField(0)
  String? displayName;
  @HiveField(1)
  String? givenName;
  @HiveField(2)
  String? middleName;
  @HiveField(3)
  String? prefix;
  @HiveField(4)
  String? suffix;
  @HiveField(5)
  String? familyName;
  @HiveField(6)
  String? company;
  @HiveField(7)
  String? jobTitle;
  @HiveField(8)
  String? emails;
  @HiveField(9)
  String? phones;
  @HiveField(10)
  String? postalAddresses;
  @HiveField(11)
  Uint8List? avatar;

  Contacts({this.displayName,this.givenName,this.middleName,this.prefix,this.suffix,this.familyName,this.company,this.jobTitle,this.emails,this.phones,this.postalAddresses,this.avatar});

}