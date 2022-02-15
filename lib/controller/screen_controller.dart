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
    dbServices.box.add(cont);
    contactsList.add(cont);
  }

  void getContacts(){
    List<Contacts> newList=[];
    contactsList.clear();
    if(dbServices.box.length==0){
      dbServices.getFromServices();
    }
    newList=dbServices.getContacts();
    newList.forEach((element) {contactsList.add(element);});
  }

  void deleteContact(int index){
    dbServices.box.deleteAt(index);
    contactsList.removeAt(index);
  }

  void filterList(String name){
    List<Contacts> newList=dbServices.getContacts();
    contactsList.clear();
    newList.forEach((element) {
      if(element.displayName!.startsWith(name)){
        contactsList.add(element);
      }
    });
  }
}