import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nuclei_assignments/model/contacts.dart';
import 'package:nuclei_assignments/model/db_services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'package:provider/provider.dart';

class Controller extends GetxController {
  var contactsList=<Contacts>[].obs;

  void addContact(Contacts cont){
    DbServices.box.add(cont);
    contactsList.add(cont);
  }

  void getContacts(){
    List<Contacts> newList=[];
    contactsList.clear();
    if(DbServices.box.length==0){
      DbServices.getFromServices();
    }
    newList=DbServices.getContacts();
    for (var element in newList) {contactsList.add(element);}
  }

  void deleteContact(int index){
    DbServices.box.deleteAt(index);
    contactsList.removeAt(index);
  }

  void filterList(String name){
    List<Contacts> newList=DbServices.getContacts();
    contactsList.clear();
    for (var element in newList) {
      if(element.displayName!.startsWith(name)){
        contactsList.add(element);
      }
    }
  }
}