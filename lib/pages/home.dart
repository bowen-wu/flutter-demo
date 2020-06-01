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
    },
    {
      'title': '费率低',
      'description': '月费率最低1.6%',
      'icon': 'images/home/low.png',
    },
    {
      'title': '下款快',
      'description': '最快当日到账',
      'icon': 'images/home/fast_payment.png',
    },
    {
      'title': '机构资金',
      'description': '安全合规',
      'icon': 'images/home/institutional_lending.png',
    }
  ];

  void goToPage(pageRoute, arguments) {
    Navigator.of(context).pushNamed(pageRoute, arguments: arguments);
  }

  Widget _getAdvantageItemWidget() {
    List<Widget> _firstLineWidgetList = [];
    List<Widget> _secondLineWidgetList = [];

    for (var index = 0; index < _advantageList.length; index++) {
      var _advantage = _advantageList[index];
      var _list = index <= 1 ? _firstLineWidgetList : _secondLineWidgetList;
      _list.add(Expanded(
        flex: 1,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: index % 2 == 0 ? 1 : 0,
                  color: Color.fromRGBO(231, 231, 231, 1)
                ),
              )
            ),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: Image(
                    image: AssetImage(_advantage['icon']),
                    width: 43,
                    height: 43,
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Text(
                            _advantage['title'],
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(51, 51, 51, 1),
                            ),
                          ),
                        ),
                        Text(
                          _advantage['description'],
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(153, 153, 153, 1)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    }

    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Color.fromRGBO(225, 225, 225, 1),
              )
            )
          ),
          child: Padding(
            padding: EdgeInsets.all(23),
            child: Flex(
              direction: Axis.horizontal,
              children: _firstLineWidgetList,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(23),
          child: Flex(
            direction: Axis.horizontal,
            children: _secondLineWidgetList,
          ),
        )
      ],
    );
  }

  _getAdvantageWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          _getAdvantageItemWidget(),
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
