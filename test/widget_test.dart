// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuclei_assignments/controller/contact_screen_controller.dart';
import 'package:get/get.dart';
import 'package:nuclei_assignments/model/contacts.dart';

void main() {
  Contacts contact1=Contacts(displayName:'Bhavishya',phones:'7337252220');
  Contacts contact2=Contacts(displayName:'Adarsh',phones:'8790117999');
  Contacts contact3=Contacts(displayName:'Bhavya',phones:'9848444250');
  ContactsController ctrl=ContactsController();
  ctrl.contactsList.add(contact1);
  ctrl.contactsList.add(contact2);
  group('addContact()', () {
    test('Adding a new contact', () {
      ctrl.addContact(contact3);
      expect(ctrl.contactsList.length,3);
    });
  });
  group('deleteContact()', () {
    test('Deleting a contact', () {
      ctrl.deleteContact(2);
      expect(ctrl.contactsList.length,2);
    });
  });
  group('filterList()', () {
    test('Filtering with letter B', () {
      ctrl.filterList('B');
      expect(ctrl.contactsList.length,1);
    });
  });
  group('Validators',(){
    group('nameValidator()',(){
      test('Positive case', () {
        ctrl.validateName("Bhavishya");
        expect(ctrl.nameValidatorMessage,null);
      });
      test('Negative case', () {
        ctrl.validateName("");
        expect(ctrl.nameValidatorMessage,"Enter a valid name");
      });
    });
    group('phoneValidator()',(){
      test('Positive case', () {
        ctrl.validateName("7337252220");
        expect(ctrl.phoneValidatorMessage,null);
      });
      test('Negative case', () {
        ctrl.validateName("121213");
        expect(ctrl.phoneValidatorMessage,"Enter a 10 digit number");
      });
    });
    group('emailValidator()',(){
      test('Positive case', () {
        ctrl.validateName("bhavishya@gmail.com");
        expect(ctrl.emailValidatorMessage,null);
      });
      test('Negative case', () {
        ctrl.validateName("121213");
        expect(ctrl.emailValidatorMessage,"Enter email in the right format");
      });
    });
  });
}
