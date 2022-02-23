import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuclei_assignments/model/contacts.dart';
import 'package:nuclei_assignments/controller/contact_screen_controller.dart';
import 'package:nuclei_assignments/controller/add_update_screen_controller.dart';

class AddContactScreen extends StatelessWidget{

  AddContactScreen({Key? key}) : super(key: key){
    controller.validateName("");
    controller.validatePhone("");
    controller.validateEmail("");
  }

  final ContactsController ctrl=Get.put(ContactsController());
  final AddUpdateController controller=Get.put(AddUpdateController());
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
                    errorText: controller.nameValidatorMessage.value
                  ),
                  onChanged: (name){
                    cont.displayName=name;
                    controller.validateName(name);
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: TextFormField(
                  decoration:   InputDecoration(
                    hintText: "Phone",
                    errorText: controller.phoneValidatorMessage.value
                  ),
                  onChanged: (number){
                    cont.phones=number;
                    controller.validatePhone(number);
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: TextFormField(
                    decoration:   InputDecoration(
                      hintText: "Email",
                      errorText: controller.emailValidatorMessage.value
                    ),
                    onChanged: (email){
                      cont.emails=email;
                      controller.validateEmail(email);
                    }
                ),
              ),
              FloatingActionButton.extended(onPressed: () {
                if(controller.phoneValidatorMessage.value==null && controller.nameValidatorMessage.value==null &&
                    controller.emailValidatorMessage.value==null){
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