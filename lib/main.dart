import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_loan_demo/pages/Login/Phone.dart';
import 'package:quick_loan_demo/pages/Login/Captcha.dart';
import 'package:quick_loan_demo/pages/Login/PhonePassword.dart';
import 'package:quick_loan_demo/model/loginModel.dart';
import 'package:quick_loan_demo/model/testModel.dart';
import 'package:quick_loan_demo/pages/test/firstPage.dart';
import 'package:quick_loan_demo/pages/test/secondPage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginModel>(create: (_) => LoginModel()),
        ChangeNotifierProvider<TestModel>(create: (_) => TestModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (context) => Phone(), //注册首页路由
          '/login/captcha': (context) => Captcha(),
          '/login/phone_password': (context) => PhonePassword(),
          '/test/first': (context) => FirstPage(),
          '/test/second': (context) => SecondPage(),
        },
      )
    );
  }
}
