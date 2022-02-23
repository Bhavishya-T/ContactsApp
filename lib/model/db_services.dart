import 'package:contacts_service/contacts_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'contacts.dart';
import 'dart:async';

class DbServices{
  static late Box _box;
  static List<Contacts> getContacts() {
    List<Contacts> contactList=_box.values.toList() as List<Contacts>;
    return contactList;
  }

  static Box get(){
    return _box;
  }
  static void printHive(){
    print(_box.values.toList());
  }

  static Future<void> init() async{
    await Hive.initFlutter();
    Hive.registerAdapter(ContactsAdapter());
    _box=await Hive.openBox<Contacts>("contactsBox");
  }

  static void getFromContactsServices() async{
    List<Contact> contacts = await ContactsService.getContacts();
    for (var element in contacts) {
      var contact=Contacts(
          displayName : element.displayName??"Name",
          givenName : element.givenName,
          middleName : element.middleName,
          prefix : element.prefix,
          suffix : element.suffix,
          familyName : element.familyName,
          company : element.company,
          jobTitle : element.jobTitle,
          emails : element.emails!.isEmpty?"@":element.emails!.first.value,
          phones : element.phones!.isEmpty?"X":element.phones!.first.value,
          postalAddresses : element.postalAddresses!.isEmpty?"NA":element.postalAddresses.toString(),
          avatar : element.avatar
      );
      _box.add(contact);
    }
  }
}