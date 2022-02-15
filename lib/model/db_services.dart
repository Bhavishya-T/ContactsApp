import 'package:nuclei_assignments/main.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'contacts.dart';
import 'dart:async';

class dbServices{
  static late Box box;
  static List<Contacts> getContacts() {
    List<Contacts> contactList=box.values.toList() as List<Contacts>;
    return contactList;
  }

  static void printHive(){
    print(box.values.toList());
  }

  static Future<void> init() async{
    box=await Hive.openBox<Contacts>("contactsBox");
  }

  static void getFromServices() async{
    List<Contact> contacts = await ContactsService.getContacts();
    contacts.forEach((element) {
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
      box.add(contact);
    });
  }
}