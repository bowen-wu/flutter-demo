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
        child: Container(
          decoration: BoxDecoration(
              border: index % 2 == 0 ? Border(
                right: BorderSide(
                  width: 0.5,
                  color: Color.fromRGBO(231, 231, 231, 1),
                ),
              ) : Border()
          ),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
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
      ));
    }

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                      color: Color.fromRGBO(225, 225, 225, 1),
                    )
                )
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 23, bottom: 23),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                children: _firstLineWidgetList,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 23, bottom: 23),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: _secondLineWidgetList,
            ),
          )
        ],
      ),
    );
  }

  _getAdvantageWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 6),
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
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 75),
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    width: 375,
                    height: 307,
                    color: Color.fromRGBO(255, 96, 81, 1),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 21, bottom: 25),
                          child: Image(
                            image: AssetImage('images/home/NO_CREDIT.png'),
                            width: 192,
                            height: 179,
                          ),
                        ),
                        Listener(
                          onPointerDown: (event) {
                            print(111);
                          },
                          child: Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.all(Radius.circular(22)),
                            ),
                            child: Center(
                              child: Text(
                                '立即申请',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(255, 96, 81, 1),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -36,
                    left: 15,
                    width: 345,
                    height: 52,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: Color.fromRGBO(255, 255, 255, 1),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(0, 2),
                            color: Color.fromRGBO(45,52,73,0.08),
                            blurRadius: 8,
                          )
                        ]
                      ),
                      child: Center(
                        child: Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Expanded(
                              flex: 0,
                              child: Padding(
                                padding: EdgeInsets.only(left: 18),
                                child: Image(
                                  image: AssetImage('images/home/notice.png'),
                                  width: 16,
                                  height: 16,
                                ),
                              )
                            ),
                            Expanded(
                                flex: 0,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 14, right: 19),
                                  child: Text(
                                      '150****2634',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromRGBO(51, 51, 51, 1),
                                      )
                                  ),
                                )
                            ),
                            Expanded(
                                flex: 0,
                                child: Flex(
                                  direction: Axis.horizontal,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 0,
                                      child: Text(
                                          '获得',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromRGBO(51, 51, 51, 1),
                                          )
                                      ),
                                    ),
                                    Expanded(
                                        flex: 0,
                                        child: Text(
                                            '100000',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromRGBO(255, 96, 81, 1),
                                            )
                                        )
                                    ),
                                    Expanded(
                                      flex: 0,
                                      child: Text(
                                          '元借款额度',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromRGBO(51, 51, 51, 1),
                                          )
                                      ),
                                    )
                                  ],
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _getAdvantageWidget()
          ],
        ),
      )
    );
  }
}
