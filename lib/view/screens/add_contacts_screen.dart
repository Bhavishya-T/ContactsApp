import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuclei_assignments/model/contacts.dart';
import 'package:nuclei_assignments/controller/screen_controller.dart';

class AddContactsPage extends StatelessWidget{

  AddContactsPage({Key? key}) : super(key: key){
    ctrl.nameValidator("");
    ctrl.phoneValidator("");
    ctrl.emailValidator("");
  }

  final Controller ctrl=Get.find();
  final Contacts cont=Contacts();

  @override
  Widget build(context){
    return Scaffold(
        appBar:  AppBar(
            title:  const Text("Add Contact")
        ),
        body: Obx(()=> Column(
            children:  <Widget>[
              ListTile(
                leading: const Icon(Icons.person),
                title: TextFormField(
                  decoration:  InputDecoration(
                    hintText: "Name",
                    errorText: ctrl.nameValidatorMessage.value
                  ),
                  onChanged: (name){
                    cont.displayName=name;
                    ctrl.nameValidator(name);
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: TextFormField(
                  decoration:   InputDecoration(
                    hintText: "Phone",
                    errorText: ctrl.phoneValidatorMessage.value
                  ),
                  onChanged: (number){
                    cont.phones=number;
                    ctrl.phoneValidator(number);
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: TextFormField(
                    decoration:   InputDecoration(
                      hintText: "Email",
                      errorText: ctrl.emailValidatorMessage.value
                    ),
                    onChanged: (email){
                      cont.emails=email;
                      ctrl.emailValidator(email);
                    }
                ),
              ),
              FloatingActionButton.extended(onPressed: () {
                if(ctrl.phoneValidatorMessage.value==null && ctrl.nameValidatorMessage.value==null &&
                ctrl.emailValidatorMessage.value==null){
                  ctrl.addContact(cont);
                }
                Get.back();
              },
                  backgroundColor: Colors.blue,
                  label: const Text("Add Contact")
              )
            ]
        )),
    );
  }
}