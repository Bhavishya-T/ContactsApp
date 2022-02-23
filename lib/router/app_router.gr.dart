// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../view/screens/add_contacts_screen.dart' as _i2;
import '../view/screens/contacts_screen.dart' as _i1;
import '../view/screens/update_screen.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ContactsApp.name: (routeData) {
      final args = routeData.argsAs<ContactsAppArgs>(
          orElse: () => const ContactsAppArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.ContactsApp(key: args.key));
    },
    AddContactsPage.name: (routeData) {
      final args = routeData.argsAs<AddContactsPageArgs>(
          orElse: () => const AddContactsPageArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.AddContactsPage(key: args.key));
    },
    UpdateContactPage.name: (routeData) {
      final args = routeData.argsAs<UpdateContactPageArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.UpdateContactPage(
              key: args.key, updatedContactIndex: args.updatedContactIndex));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(ContactsApp.name, path: '/'),
        _i4.RouteConfig(AddContactsPage.name, path: '/add-contacts-page'),
        _i4.RouteConfig(UpdateContactPage.name, path: '/update-contact-page')
      ];
}

/// generated route for
/// [_i1.ContactsApp]
class ContactsApp extends _i4.PageRouteInfo<ContactsAppArgs> {
  ContactsApp({_i5.Key? key})
      : super(ContactsApp.name, path: '/', args: ContactsAppArgs(key: key));

  static const String name = 'ContactsApp';
}

class ContactsAppArgs {
  const ContactsAppArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'ContactsAppArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.AddContactsPage]
class AddContactsPage extends _i4.PageRouteInfo<AddContactsPageArgs> {
  AddContactsPage({_i5.Key? key})
      : super(AddContactsPage.name,
            path: '/add-contacts-page', args: AddContactsPageArgs(key: key));

  static const String name = 'AddContactsPage';
}

class AddContactsPageArgs {
  const AddContactsPageArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'AddContactsPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.UpdateContactPage]
class UpdateContactPage extends _i4.PageRouteInfo<UpdateContactPageArgs> {
  UpdateContactPage({_i5.Key? key, required int updatedContactIndex})
      : super(UpdateContactPage.name,
            path: '/update-contact-page',
            args: UpdateContactPageArgs(
                key: key, updatedContactIndex: updatedContactIndex));

  static const String name = 'UpdateContactPage';
}

class UpdateContactPageArgs {
  const UpdateContactPageArgs({this.key, required this.updatedContactIndex});

  final _i5.Key? key;

  final int updatedContactIndex;

  @override
  String toString() {
    return 'UpdateContactPageArgs{key: $key, updatedContactIndex: $updatedContactIndex}';
  }
}
