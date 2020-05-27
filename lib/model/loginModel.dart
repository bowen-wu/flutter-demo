import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String _phoneNumber = '134';

  void updatePhoneNumber(phone) {
    print(phone);
    _phoneNumber = phone;
    notifyListeners();
  }

  get phoneNumber => _phoneNumber;
}
