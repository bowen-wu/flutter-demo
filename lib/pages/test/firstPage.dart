import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_loan_demo/model/testModel.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FirstPage createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {

    void goToPage(pageRoute, arguments) {
      Navigator.of(context).pushNamed(pageRoute, arguments: arguments);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('first page'),
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
                  builder: (context, testModel, _)=> Text('this is First Page! testNum: ${testModel.testNum}')
              ),
              Listener(
                onPointerDown: (event) => {
                  goToPage('/test/second', {})
                },
                child: Text('Go To Second Page'),
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
