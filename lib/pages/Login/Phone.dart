import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_loan_demo/model/loginModel.dart';
import 'package:quick_loan_demo/services/login.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Phone extends StatefulWidget {
  Phone({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Phone createState() => _Phone();
}

class _Phone extends State<Phone> {
  LoginService loginService = LoginService();

  String _phoneNumber = '';
  bool _captchaStatus = false;

  static bool isChinaPhoneLegal(String str) {
    return new RegExp('^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$').hasMatch(str);
  }

  void goToPage(pageRoute, arguments) {
    Navigator.of(context).pushNamed(pageRoute, arguments: arguments);
  }

  void _onInputChange(event, loginModel) {
    if(isChinaPhoneLegal(event)) {
      loginModel.updatePhoneNumber(event);
      setState(() {
        _phoneNumber = event;
        _captchaStatus = true;
      });
    } else {
      setState(() {
        _phoneNumber = event;
        _captchaStatus = false;
      });
    }
  }

  void _getCaptcha(event) async {
    if(_captchaStatus) {
      print(1);
      var res = await loginService.sendSmsCode(_phoneNumber);
      print(res);
      goToPage('/login/captcha', {});
    }
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
            EasyLoading.show(status: 'loading...');
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
                '登录注册',
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 80),
                child: Row(
                  children: <Widget>[
                    Text(
                      '登录注册表示同意',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(51, 51, 51, 1),
                      ),
                    ),
                    Listener(
                      child: Text(
                        '用户协议',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(93, 139, 255, 1),
                        ),
                      ),
                      onPointerDown: (PointerDownEvent event) => goToPage('/test/first', {}),
                      onPointerMove: (PointerMoveEvent event) => print(event),
                      onPointerUp: (PointerUpEvent event) => print(event),
                    )
                  ],
                ),
              ),
              Consumer<LoginModel>(
                builder: (context, loginModel, child) => TextField(
                  autofocus: false,
                  maxLength: 11,
                  onChanged: (event) => _onInputChange(event, loginModel),
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(51, 51, 51, 1),
                  ),
                  decoration: InputDecoration(
                    counterText: "",
                    hintText: "请输入手机号",
                    hintStyle: TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(153, 153, 153, 1),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(255, 89, 65, 1)),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 31),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Listener(
                        onPointerDown: (event) {
                          goToPage('/login/phone_password', _phoneNumber.isNotEmpty ? {_phoneNumber: _phoneNumber} : {});
                        },
                        child: Text(
                          "使用账号密码登录",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(153, 153, 153, 1),
                          ),
                        ),
                      )

                    ],
                  )),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: _captchaStatus ? Color.fromRGBO(255, 96, 81, 1) : Color.fromRGBO(255, 207, 201, 1),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  child: Listener(
                    child: Column(
                      children: <Widget>[
                        Text(
                          '获取手机验证码',
                          style: TextStyle(
                            fontSize: 19,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        )
                      ],
                    ),
                    onPointerDown: _getCaptcha,
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
