import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_loan_demo/model/loginModel.dart';

class Captcha extends StatefulWidget {
  Captcha({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Captcha createState() => _Captcha();
}

class _Captcha extends State<Captcha> {
  String _captcha = '';

  TextEditingController _captchaInputController = TextEditingController();
  FocusNode _captchaFocus = FocusNode();
  FocusScopeNode focusScopeNode;
  final int _captchaNumber = 6;

  List<Widget> _ConstructorSquare() {
    List<Widget> squareList = [];
    for(var i = 0; i < _captchaNumber; i++) {
      squareList.add(
        Padding(
          padding: EdgeInsets.only(right: i == 5 ? 0 : 9),
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              border: Border.all(width: 1, color: _captcha.length == i || (i == 5 && _captcha.length >= 51) ? Color.fromRGBO(255, 96, 81, 1) : Color.fromRGBO(231, 231, 231, 1)),
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
            child: Center(
              child: Text(
                '${i + 1 <= _captcha.length ? _captcha.substring(i, i + 1) : ''}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(51, 51, 51, 1),
                ),
              ),
            ),
          ),
        )
      );
    }
    return squareList;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '请输入验证码',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(51, 51, 51, 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 38),
                child: Text(
                  '验证码已通过短信发送至 ${Provider.of<LoginModel>(context, listen: false).phoneNumber}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(51, 51, 51, 1),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 11),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '${_captchaNumber}位数字验证码',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(153, 153, 153, 1),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Listener(
                        onPointerDown: (event) {
                          print(1);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Color.fromRGBO(153, 153, 153, 1)),
                              borderRadius: BorderRadius.all(Radius.circular(11)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
                              child: Text(
                                '59s后重新获取',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(153, 153, 153, 1),
                                ),
                              ),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Offstage(
                offstage: true,
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorWidth: 0,
                  cursorColor: Color.fromRGBO(255, 255, 255, 1),
                  autofocus: false,
                  focusNode: _captchaFocus,
                  controller: _captchaInputController,
                  maxLength: _captchaNumber,
                  onChanged: (event) {
                    setState(() {
                      _captcha = event;
                    });
                  },
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: '',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Listener(
                onPointerDown: (event) {
                  if(null == focusScopeNode){
                    focusScopeNode = FocusScope.of(context);
                  }
                  focusScopeNode.requestFocus(_captchaFocus);
                },
                child: Flex(
                  direction: Axis.horizontal,
                  children: _ConstructorSquare(),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}
