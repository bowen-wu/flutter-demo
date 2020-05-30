import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;
  void updatePhoneNumber(phone) {
    _phoneNumber = phone;
    notifyListeners();
  }

}
