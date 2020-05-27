import 'package:flutter/material.dart';

class TestModel extends ChangeNotifier {
  int _testNum = 1234;
  int get testNum => _testNum;

  void increment() {
    _testNum++;
    print('_testNum');
    print(_testNum);
    notifyListeners();
  }
}
