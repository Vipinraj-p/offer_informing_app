import 'package:flutter/material.dart';

class DetailsProvider extends ChangeNotifier {
  String email = '';
  void updatemail(emailAddress) {
    email = emailAddress;
    notifyListeners();
  }

  notifyListeners();
}
