import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_loan_demo/model/testModel.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SecondPage createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second page'),
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
          child: Container(
            child: Column(
              children: <Widget>[
                Consumer<TestModel>(
                  builder: (context, TestModel test, child) => Center(
                    child: Text(
                      'this is Second Page! testNum: ${test.testNum}',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                Listener(
                  onPointerDown: (event) => {
                    Navigator.pop(context)
                  },
                  child: Text('Go To First Page'),
                ),
                Consumer<TestModel>(
                  builder: (context, TestModel test, child) => Center(
                    child: Listener(
                      onPointerDown: (event) {
                        test.increment();
                      },
                      child: Center(
                        child: Text('增加 number'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
