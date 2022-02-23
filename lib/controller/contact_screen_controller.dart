import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:nuclei_assignments/model/contacts.dart';
import 'package:nuclei_assignments/model/db_services.dart';

class ContactsController extends GetxController {
  var contactsList=<Contacts>[].obs;

  void addContact(Contacts cont){
    Box box=DbServices.get();
    box.add(cont);
    contactsList.add(cont);
  }

  void getContacts(){
    Box box=DbServices.get();
    List<Contacts> newList=[];
    contactsList.clear();
    if(box.length==0){
      DbServices.getFromContactsServices();
    }
    newList=DbServices.getContacts();
    for (var element in newList) {contactsList.add(element);}
  }

  void deleteContact(int index){
    Box box=DbServices.get();
    box.deleteAt(index);
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