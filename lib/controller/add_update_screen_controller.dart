import 'package:get/get.dart';
import 'package:nuclei_assignments/model/contacts.dart';
import 'package:nuclei_assignments/model/db_services.dart';
import 'constants.dart';

class AddUpdateController extends GetxController {
  RxnString nameValidatorMessage = RxnString(null);
  RxnString phoneValidatorMessage=RxnString(null);
  RxnString emailValidatorMessage=RxnString(null);

  void validateName(String name){
    nameValidatorMessage.value=null;
    if(name.isEmpty){
      nameValidatorMessage.value="Enter a valid name";
    }
  }

  void validatePhone(String number){
    phoneValidatorMessage.value=null;
    if(number.length!=10){
      phoneValidatorMessage.value="Enter a 10 digit number";
    }
  }

  void validateEmail(String email){
    bool emailValid = RegExp(Constants.EMAIL_VALIDATION_REGEX).hasMatch(email);
    emailValidatorMessage.value=null;
    if(!emailValid){
      emailValidatorMessage.value="Enter email in the right format";
    }
  }
}