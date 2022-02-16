import 'package:get/get.dart';
import 'package:nuclei_assignments/model/contacts.dart';
import 'package:nuclei_assignments/model/db_services.dart';

class Controller extends GetxController {
  var contactsList=<Contacts>[].obs;
  RxnString nameValidatorMessage = RxnString(null);
  RxnString phoneValidatorMessage=RxnString(null);
  RxnString emailValidatorMessage=RxnString(null);

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

  void nameValidator(String name){
    nameValidatorMessage.value=null;
    if(name.isEmpty){
      nameValidatorMessage.value="Enter a valid name";
    }
  }

  void phoneValidator(String number){
    phoneValidatorMessage.value=null;
    if(number.length!=10){
      phoneValidatorMessage.value="Enter a 10 digit number";
    }
  }

  void emailValidator(String email){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    emailValidatorMessage.value=null;
    if(!emailValid){
      emailValidatorMessage.value="Enter email in the right format";
    }
  }
}