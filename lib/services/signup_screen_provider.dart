import 'package:flutter/material.dart';

class SignupScreenProvider extends ChangeNotifier {
  List<String> options = [
    'Customer',
    'Business',
  ];
  String currentItemSelected = "Customer";
  String loginAs = "Customer";
  void dropdownchange(newValueSelected) {
    currentItemSelected = newValueSelected!;
    loginAs = newValueSelected;
    notifyListeners();
  }
}
