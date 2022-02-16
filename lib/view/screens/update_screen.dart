import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuclei_assignments/model/contacts.dart';
import 'package:nuclei_assignments/controller/screen_controller.dart';


class UpdateContactPage extends StatelessWidget{
  UpdateContactPage({Key? key}) : super(key: key){
    updatedContact.displayName=ctrl.contactsList.elementAt(updatedContactIndex).displayName;
    updatedContact.phones=ctrl.contactsList.elementAt(updatedContactIndex).phones;
    updatedContact.emails=ctrl.contactsList.elementAt(updatedContactIndex).emails;
    ctrl.nameValidator(updatedContact.displayName!);
    ctrl.phoneValidator(updatedContact.phones!);
    ctrl.emailValidator(updatedContact.emails!);
  }

  final Controller ctrl=Get.find();
  final int updatedContactIndex=Get.arguments;
  final Contacts updatedContact=Contacts();

  @override
  Widget build(context){
    return Scaffold(
        appBar:  AppBar(
            title:  const Text("Update Contact")
        ),
        body: Obx(()=> Column(
            children:  <Widget>[
              ListTile(
                leading: const Icon(Icons.person),
                title: TextFormField(
                    initialValue: updatedContact.displayName,
                    decoration:  InputDecoration(
                        errorText: ctrl.nameValidatorMessage.value
                    ),
                    onChanged: (name){
                      updatedContact.displayName=name;
                      ctrl.nameValidator(name);
                    }
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: TextFormField(
                    initialValue: updatedContact.phones,
                    decoration:   InputDecoration(
                        errorText: ctrl.phoneValidatorMessage.value
                    ),
                    onChanged: (number){
                      updatedContact.phones=number;
                      ctrl.phoneValidator(number);
                    }
                ),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: TextFormField(
                    initialValue: updatedContact.emails,
                    decoration:   InputDecoration(
                        errorText: ctrl.emailValidatorMessage.value
                    ),
                    onChanged: (email){
                      updatedContact.emails=email;
                      ctrl.emailValidator(email);
                    }
                ),
              ),
              FloatingActionButton.extended(onPressed: () {
                if(ctrl.phoneValidatorMessage.value==null && ctrl.nameValidatorMessage.value==null &&
                    ctrl.emailValidatorMessage.value==null){
                  ctrl.deleteContact(updatedContactIndex);
                  ctrl.addContact(updatedContact);
                }
                Get.back();
              },
                  backgroundColor: Colors.blue,
                  label: const Text("Update Contact")
              )
            ]
        )),
    );
  }
}