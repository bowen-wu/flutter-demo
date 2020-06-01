import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_loan_demo/pages/Login/Phone.dart';
import 'package:quick_loan_demo/pages/Login/Captcha.dart';
import 'package:quick_loan_demo/pages/Login/PhonePassword.dart';
import 'package:quick_loan_demo/model/loginModel.dart';
import 'package:quick_loan_demo/model/testModel.dart';
import 'package:quick_loan_demo/pages/Login/ResetPassword.dart';
import 'package:quick_loan_demo/pages/home.dart';
import 'package:quick_loan_demo/pages/test/firstPage.dart';
import 'package:quick_loan_demo/pages/test/secondPage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:quick_loan_demo/utils/MaxScaleTextWidget.dart';

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
  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: MaterialApp(
            title: '即客贷',
            theme: ThemeData(
              primaryColor: Color.fromRGBO(255, 96, 81, 1),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              cursorColor: Color.fromRGBO(255, 96, 81, 1),
              focusColor: Color.fromRGBO(255, 96, 81, 1),
            ),
            builder: (context, widget) {
              return MaxScaleTextWidget(
                max: 1.0,
                child: widget,
              );
            },
            routes: {
              '/': (context) => Phone(), //注册首页路由
              '/login/captcha': (context) => Captcha(),
              '/login/phone_password': (context) => PhonePassword(),
              '/login/reset_password': (context) => ResetPassword(),
              '/home': (context) => Home(),
              '/test/first': (context) => FirstPage(),
              '/test/second': (context) => SecondPage(),
            },
          ),
        )
    );
  }
}
