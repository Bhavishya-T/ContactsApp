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
import 'package:nuclei_assignments/controller/screen_controller.dart';


class UpdateContactPage extends StatelessWidget{
  UpdateContactPage({Key? key}) : super(key: key);

  Controller ctrl=Get.find();
  late int updatedContactIndex;

  @override
  Widget build(context){
    Contacts updatedContact=Contacts();
    updatedContact.displayName=ctrl.contactsList.elementAt(updatedContactIndex).displayName;
    updatedContact.phones=ctrl.contactsList.elementAt(updatedContactIndex).phones;
    updatedContact.emails=ctrl.contactsList.elementAt(updatedContactIndex).emails;
    return Scaffold(
        appBar:  AppBar(
            title:  const Text("Update Contact")
        ),
        body:  Column(
            children:  <Widget>[
              ListTile(
                leading: const Icon(Icons.person),
                title:  TextFormField(
                    initialValue: ctrl.contactsList.elementAt(updatedContactIndex).displayName,
                    onChanged: (name){
                      updatedContact.displayName=name;
                    }
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title:  TextFormField(
                    initialValue: ctrl.contactsList.elementAt(updatedContactIndex).phones,
                    onChanged: (number){
                      updatedContact.phones=number;
                    }
                ),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title:  TextFormField(
                    initialValue: ctrl.contactsList.elementAt(updatedContactIndex).emails,
                    onChanged: (email){
                      updatedContact.emails=email;
                    }
                ),
              )]
        ),
        floatingActionButton: FloatingActionButton.extended(onPressed: () {
          ctrl.deleteContact(updatedContactIndex);
          ctrl.addContact(updatedContact);
          Get.back();
        },
            backgroundColor: Colors.blue,
            label: const Text("Update Contact")
        )
    );
  }
}