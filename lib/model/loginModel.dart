import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  final _phoneNumber = '';

  void updatePhoneNumber(phone) {
    print(phone);
    notifyListeners();
  }

  get phoneNumber => _phoneNumber;
}
