import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuclei_assignments/model/db_services.dart';
import 'view/screens/contacts_screen.dart';
import 'view/screens/add_contacts_screen.dart';
import 'view/screens/update_screen.dart';
import 'package:nuclei_assignments/controller/constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DbServices.init();
  runApp(const ContactsApp());
}

class ContactsApp extends StatelessWidget{
  const ContactsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      initialRoute: Constants.CONTACTS_SCREEN,
      defaultTransition: Transition.native,
      getPages: [
        GetPage(
          name: Constants.CONTACTS_SCREEN,
          page: () => ContactsListScreen()),
        GetPage(
          name: Constants.ADD_CONTACTS_SCREEN,
          page: () => AddContactScreen(),
        ),
        GetPage(
          name: Constants.UPDATE_SCREEN,
          page: () => UpdateContactScreen(),
        ),
      ],
    );
  }
}

