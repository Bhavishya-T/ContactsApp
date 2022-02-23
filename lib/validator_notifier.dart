import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuclei_assignments/model/db_services.dart';
import 'view/screens/contacts_screen.dart';
import 'view/screens/add_contacts_screen.dart';
import 'view/screens/update_screen.dart';
import 'package:nuclei_assignments/controller/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nuclei_assignments/router/app_router.gr.dart';
import 'package:provider/provider.dart';

class ValidatorNotifier with ChangeNotifier {
  String? nameValidatorMessage;
  String? phoneValidatorMessage;
  String? emailValidatorMessage;

  void nameValidator(String name){
    nameValidatorMessage=null;
    if(name.isEmpty){
      nameValidatorMessage="Enter a valid name";
    }
    notifyListeners();
  }

  void phoneValidator(String number){
    phoneValidatorMessage=null;
    if(number.length!=10){
      phoneValidatorMessage="Enter a 10 digit number";
    }
  }

  void emailValidator(String email){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    emailValidatorMessage=null;
    if(!emailValid){
      emailValidatorMessage="Enter email in the right format";
    }
  }
}