import 'package:flutter/material.dart';
import 'package:quick_loan_demo/services/login.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  LoginService loginService = LoginService();
  final List<Map> _advantageList = [
    {
      'title': '额度高',
      'description': '最高可贷10万元',
      'icon': 'images/home/high_quota.png',
    }, {
      'title': '费率低',
      'description': '月费率最低1.6%',
      'icon': 'images/home/low.png',
    }, {
      'title': '下款快',
      'description': '最快当日到账',
      'icon': 'images/home/fast_payment.png',
    }, {
      'title': '机构资金',
      'description': '安全合规',
      'icon': 'images/home/institutional_lending.png',
    }
  ];

  void goToPage(pageRoute, arguments) {
    Navigator.of(context).pushNamed(pageRoute, arguments: arguments);
  }

  List<Widget> _getAdvantageItemWidget() {
    List<Widget> _advantageWidgetList = [];
    _advantageList.map((_advantage) => {
      _advantageWidgetList.add(
        Expanded(
          child: Flex(

            children: <Widget>[
              Image(
                image: AssetImage(_advantage.icon),
              )
            ],
          ),
        )
      )
    })
  }

  _getAdvantageWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 29),
            child: Center(
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 13,
                    child: Container(
                      height: 13,
                      width: 112,
                      color: Color.fromRGBO(255, 211, 205, 1),
                    ),
                  ),
                  Text(
                    '四大优势',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flex(
            direction: Axis.horizontal,
            children: _getAdvantageItemWidget(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('即客贷'),
        backgroundColor: Color.fromRGBO(255, 96, 81, 1),
        automaticallyImplyLeading: false,
      ),
      body: _getAdvantageWidget(),
    );
  }
}
