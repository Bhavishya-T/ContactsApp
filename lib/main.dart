import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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

//segregation,singleton,naming,exception handling,cases
//test cases - mockito



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ContactsAdapter());
  await dbServices.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return GetMaterialApp(home : contacts_screen.ContactsApp());
  }
}

// class ContactsApp extends StatelessWidget {
//   ContactsApp({Key? key}) : super(key: key);
//
//   final controller=Get.put(Controller());
//
//   @override
//   Widget build(BuildContext context){
//     controller.getContacts();
//     return GetMaterialApp(home: Scaffold(
//       appBar: AppBar(
//         title:  TextFormField(
//           decoration: InputDecoration(
//               hintText: 'Search',
//               prefixIcon: Icon(Icons.search)
//           ),
//           onChanged: (searchedName){
//             if(searchedName.isNotEmpty && searchedName!=null){
//               controller.filterList(searchedName);
//             }
//             else{
//               controller.getContacts();
//             }
//           },
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Get.to(AddContactsPage());
//             },
//             child: Text("Add Contact"),
//           ),
//         ],
//       ),
//       body : Obx(()=>ListView.builder(
//         itemCount: controller.contactsList.length ?? 0,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             contentPadding:
//             const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
//             leading: (CircleAvatar(
//               child: Text(controller.contactsList.elementAt(index).displayName==null?"NA":controller.contactsList.elementAt(index).displayName![0]),
//               backgroundColor: Theme.of(context).accentColor,
//             )),
//             title: Text(controller.contactsList.elementAt(index).displayName ?? 'Name'),
//             subtitle: Text(controller.contactsList.elementAt(index).phones??'NA'),
//             trailing: IconButton(
//               icon: Icon(Icons.delete),
//               onPressed: ()=>controller.deleteContact(index)
//             ),
//             onLongPress: (){
//               UpdateContactPage update=UpdateContactPage();
//               update.updatedContactIndex=index;
//               Get.to(update);
//             }
//           );
//         }
//       )),
//         floatingActionButton : FloatingActionButton.extended(
//         onPressed: () {
//           dbServices.box.clear();
//           controller.getContacts();
//         },
//         backgroundColor: Colors.blue,
//         label: const Text("Refresh Page")
//     )
//     ));
//   }
// }
//
// class AddContactsPage extends StatelessWidget{
//   final Controller ctrl=Get.find();
//   final TextEditingController _controller = TextEditingController();
//   Widget build(context){
//     Contacts cont=Contacts();
//     return Scaffold(
//       appBar:  AppBar(
//         title:  Text("Add Contact")
//       ),
//       body:  Column(
//           children:  <Widget>[
//            ListTile(
//             leading: Icon(Icons.person),
//             title:  TextFormField(
//               decoration:  InputDecoration(
//                 hintText: "Name",
//               ),
//               onChanged: (name){
//                 cont.displayName=name;
//               },
//             ),
//           ),
//            ListTile(
//             leading: Icon(Icons.phone),
//             title:  TextFormField(
//               decoration:  InputDecoration(
//                 hintText: "Phone",
//               ),
//               onChanged: (number){
//                 cont.phones=number;
//               },
//             ),
//           ),
//            ListTile(
//             leading: Icon(Icons.email),
//             title:  TextFormField(
//               decoration:  InputDecoration(
//                 hintText: "Email",
//               ),
//                 onChanged: (email){
//                   cont.emails=email;
//                 }
//             ),
//           )]
//     ),
//     floatingActionButton: FloatingActionButton.extended(onPressed: () {
//       ctrl.addContact(cont);
//       Get.back();
//     },
//       backgroundColor: Colors.blue,
//       label: const Text("Add Contact")
//     )
//     );
//   }
// }
//
// class UpdateContactPage extends StatelessWidget{
//   Controller ctrl=Get.find();
//   late int updatedContactIndex;
//   Widget build(context){
//     Contacts updatedContact=Contacts();
//     updatedContact.displayName=ctrl.contactsList.elementAt(updatedContactIndex).displayName;
//     updatedContact.phones=ctrl.contactsList.elementAt(updatedContactIndex).phones;
//     updatedContact.emails=ctrl.contactsList.elementAt(updatedContactIndex).emails;
//     return Scaffold(
//         appBar:  AppBar(
//             title:  Text("Update Contact")
//         ),
//         body:  Column(
//             children:  <Widget>[
//               ListTile(
//                 leading: Icon(Icons.person),
//                 title:  TextFormField(
//                   initialValue: ctrl.contactsList.elementAt(updatedContactIndex).displayName,
//                   onChanged: (name){
//                     updatedContact.displayName=name;
//                   }
//                 ),
//               ),
//               ListTile(
//                 leading: Icon(Icons.phone),
//                   title:  TextFormField(
//                     initialValue: ctrl.contactsList.elementAt(updatedContactIndex).phones,
//                     onChanged: (number){
//                       updatedContact.phones=number;
//                     }
//                   ),
//               ),
//               ListTile(
//                 leading: Icon(Icons.email),
//                   title:  TextFormField(
//                     initialValue: ctrl.contactsList.elementAt(updatedContactIndex).emails,
//                     onChanged: (email){
//                       updatedContact.emails=email;
//                     }
//                   ),
//               )]
//         ),
//         floatingActionButton: FloatingActionButton.extended(onPressed: () {
//           ctrl.deleteContact(updatedContactIndex);
//           ctrl.addContact(updatedContact);
//           Get.back();
//         },
//           backgroundColor: Colors.blue,
//           label: const Text("Update Contact")
//         )
//     );
//   }
// }
//
// class Controller extends GetxController {
//   var contactsList=<Contacts>[].obs;
//
//   void addContact(Contacts cont){
//     dbServices.box.add(cont);
//     contactsList.add(cont);
//   }
//
//   void getContacts(){
//     List<Contacts> newList=[];
//     contactsList.clear();
//     if(dbServices.box.length==0){
//       dbServices.getFromServices();
//     }
//     newList=dbServices.getContacts();
//     newList.forEach((element) {contactsList.add(element);});
//   }
//
//   void deleteContact(int index){
//     dbServices.box.deleteAt(index);
//     contactsList.removeAt(index);
//   }
//
//   void filterList(String name){
//     List<Contacts> newList=dbServices.getContacts();
//     contactsList.clear();
//     newList.forEach((element) {
//       if(element.displayName!.startsWith(name)){
//         contactsList.add(element);
//       }
//     });
//   }
// }
//
