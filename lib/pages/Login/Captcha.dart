import 'package:flutter/material.dart';

class Captcha extends StatefulWidget {
  Captcha({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Captcha createState() => _Captcha();
}

class _Captcha extends State<Captcha> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Basic AppBar'),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        leading: IconButton(
          icon: Image(image: AssetImage("images/back.png"), width: 18.0),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Text('验证码！')
        ),
      ),
    );
  }
}
