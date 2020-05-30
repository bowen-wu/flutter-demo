import 'package:flutter/material.dart';
import 'package:quick_loan_demo/services/login.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  LoginService loginService = LoginService();

  void goToPage(pageRoute, arguments) {
    Navigator.of(context).pushNamed(pageRoute, arguments: arguments);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic AppBar'),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
      ),
      body: Text('this is Home page!'),
    );
  }
}
