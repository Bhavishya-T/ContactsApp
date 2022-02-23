import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuclei_assignments/model/contacts.dart';
import 'package:nuclei_assignments/controller/contact_screen_controller.dart';
import 'package:nuclei_assignments/controller/add_update_screen_controller.dart';

class UpdateContactScreen extends StatelessWidget{
  UpdateContactScreen({Key? key}) : super(key: key){
    updatedContact.displayName=ctrl.contactsList.elementAt(updatedContactIndex).displayName;
    updatedContact.phones=ctrl.contactsList.elementAt(updatedContactIndex).phones;
    updatedContact.emails=ctrl.contactsList.elementAt(updatedContactIndex).emails;
    controller.validateName(updatedContact.displayName!);
    controller.validatePhone(updatedContact.phones!);
    controller.validateEmail(updatedContact.emails!);
  }

  final ContactsController ctrl=Get.put(ContactsController());
  final AddUpdateController controller=Get.put(AddUpdateController());
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
                        errorText: controller.nameValidatorMessage.value
                    ),
                    onChanged: (name){
                      updatedContact.displayName=name;
                      controller.validateName(name);
                    }
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: TextFormField(
                    initialValue: updatedContact.phones,
                    decoration:   InputDecoration(
                        errorText: controller.phoneValidatorMessage.value
                    ),
                    onChanged: (number){
                      updatedContact.phones=number;
                      controller.validatePhone(number);
                    }
                ),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: TextFormField(
                    initialValue: updatedContact.emails,
                    decoration:   InputDecoration(
                        errorText: controller.emailValidatorMessage.value
                    ),
                    onChanged: (email){
                      updatedContact.emails=email;
                      controller.validateEmail(email);
                    }
                ),
              ),
              FloatingActionButton.extended(onPressed: () {
                if(controller.phoneValidatorMessage.value==null && controller.nameValidatorMessage.value==null &&
                    controller.emailValidatorMessage.value==null){
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