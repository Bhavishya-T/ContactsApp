import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive_flutter/hive_flutter.dart';
import 'model/contacts.dart';
import 'package:nuclei_assignments/model/db_services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'view/screens/contacts_screen.dart' as contacts_screen;
import 'view/screens/add_contacts_screen.dart' as add_screen;
import 'view/screens/update_screen.dart' as update_screen;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ContactsAdapter());
  await DbServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      initialRoute: '/contactsApp',
      defaultTransition: Transition.native,
      getPages: [
        GetPage(name: '/contactsApp', page: () => contacts_screen.ContactsApp()),
        GetPage(
          name: '/addContactsPage',
          page: () => add_screen.AddContactsPage(),
        ),
        GetPage(
          name: '/updateScreen',
          page: () => update_screen.UpdateContactPage(),
        ),
      ],
    );
  }
}

