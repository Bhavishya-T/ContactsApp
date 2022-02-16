import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuclei_assignments/model/db_services.dart';
import 'package:nuclei_assignments/controller/screen_controller.dart';
import 'package:nuclei_assignments/controller/constants.dart';



class ContactsApp extends StatelessWidget {
  ContactsApp({Key? key}) : super(key: key){
    controller.getContacts();
  }

  final controller=Get.put(Controller());

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title:  TextFormField(
            decoration: const InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search)
            ),
            onChanged: (searchedName){
              if(searchedName.isNotEmpty){
                controller.filterList(searchedName);
              }
              else{
                controller.getContacts();
              }
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.toNamed(Constants.ADD_CONTACTS_SCREEN);
              },
              child: const Text("Add Contact"),
            ),
          ],
        ),
        body : Obx(()=>ListView.builder(
            itemCount: controller.contactsList.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
                  leading: (CircleAvatar(
                    child: Text(controller.contactsList.elementAt(index).displayName==null?"NA":controller.contactsList.elementAt(index).displayName![0]),
                    backgroundColor: Theme.of(context).accentColor,
                  )),
                  title: Text(controller.contactsList.elementAt(index).displayName ?? 'Name'),
                  subtitle: Text(controller.contactsList.elementAt(index).phones??'NA'),
                  trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: ()=>controller.deleteContact(index)
                  ),
                  onLongPress: (){
                    // update_screen.UpdateContactPage update=update_screen.UpdateContactPage();
                    // update.updatedContactIndex=index;
                    Get.toNamed(Constants.UPDATE_SCREEN,arguments: index);
                  }
              );
            }
        )),
        floatingActionButton : FloatingActionButton.extended(
            onPressed: () {
              DbServices.box.clear();
              controller.getContacts();
            },
            backgroundColor: Colors.blue,
            label: const Text("Refresh Page")
        )
    );
  }
}