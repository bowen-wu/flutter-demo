import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;
  void updatePhoneNumber(phone) {
    _phoneNumber = phone;
    notifyListeners();
  }

  bool _isInputControllerCauseKeyboardVisible = false;
  bool get isInputControllerCauseKeyboardVisible => _isInputControllerCauseKeyboardVisible;
  void updateIsInputControllerCauseKeyboardVisible (isInputControllerCauseKeyboardVisible) {
    _isInputControllerCauseKeyboardVisible = isInputControllerCauseKeyboardVisible;
    notifyListeners();
  }

  bool _isLogin = false;
  bool get isLogin => _isLogin;
  void updateIsLogin(isLogin) {
    _isLogin = isLogin;
    notifyListeners();
  }
}
