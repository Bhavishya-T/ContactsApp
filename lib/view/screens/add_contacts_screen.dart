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

class AddContactsPage extends StatelessWidget{

  AddContactsPage({Key? key}) : super(key: key);

  final Controller ctrl=Get.find();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(context){
    Contacts cont=Contacts();
    return Scaffold(
        appBar:  AppBar(
            title:  const Text("Add Contact")
        ),
        body:  Column(
            children:  <Widget>[
              ListTile(
                leading: const Icon(Icons.person),
                title:  TextFormField(
                  decoration:  const InputDecoration(
                    hintText: "Name",
                  ),
                  onChanged: (name){
                    cont.displayName=name;
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title:  TextFormField(
                  decoration:  const InputDecoration(
                    hintText: "Phone",
                  ),
                  onChanged: (number){
                    cont.phones=number;
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title:  TextFormField(
                    decoration:  const InputDecoration(
                      hintText: "Email",
                    ),
                    onChanged: (email){
                      cont.emails=email;
                    }
                ),
              )]
        ),
        floatingActionButton: FloatingActionButton.extended(onPressed: () {
          ctrl.addContact(cont);
          Get.back();
        },
            backgroundColor: Colors.blue,
            label: const Text("Add Contact")
        )
    );
  }
}