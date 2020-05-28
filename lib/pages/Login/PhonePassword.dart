import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_loan_demo/model/loginModel.dart';

class PhonePassword extends StatefulWidget {
  PhonePassword({Key key}) : super(key: key);

  @override
  _PhonePassword createState() => _PhonePassword();
}

class _PhonePassword extends State<PhonePassword> {
  String phoneNumber = '';
  String password = '';
  bool phoneComplete = false;
  TextEditingController _phoneNumberController = TextEditingController();

  initState() {
    super.initState();
    final _loginModel = Provider.of<LoginModel>(context, listen: false);
    if(_loginModel.phoneNumber != null) {
      phoneNumber = _loginModel.phoneNumber;
      _phoneNumberController = TextEditingController(text: _loginModel.phoneNumber);
    }
    _phoneNumberController.addListener((){
      print(_phoneNumberController.text);
      if (isChinaPhoneLegal(_phoneNumberController.text)) {
        _loginModel.updatePhoneNumber(_phoneNumberController.text);
        setState(() {
          phoneNumber = _phoneNumberController.text;
          phoneComplete = true;
        });
      } else {
        setState(() {
          phoneNumber = _phoneNumberController.text;
          phoneComplete = false;
        });
      }
    });
  }

  void goToPage(pageRoute) {
    Navigator.pushNamed(context, pageRoute);
  }

  static bool isChinaPhoneLegal(String str) {
    return new RegExp('^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$').hasMatch(str);
  }


  void _login(event) {
    if(isChinaPhoneLegal(phoneNumber) && password.isNotEmpty) {
      // TODO: login
    }
  }

  void _onPasswordChange(event) {
    setState(() {
      password = event;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  '请输入登录密码',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromRGBO(51, 51, 51, 1),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 57),
                  child: Text(
                    '请使用手机账号密码登录',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                  ),
                ),
                Consumer<LoginModel>(
                  builder: (context, loginModel, child) => TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 11,
                    controller: _phoneNumberController,
                    autofocus: false,
                    style: TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(51, 51, 51, 1),
                    ),
                    decoration: InputDecoration(
                      counterText: '',
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
                TextField(
                  onChanged: _onPasswordChange,
                  autofocus: false,
                  obscureText: true,
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(51, 51, 51, 1),
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: "请输入密码",
                    hintStyle: TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(153, 153, 153, 1),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(255, 89, 65, 1)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 30),
                      child: Listener(
                        onPointerDown: (event) =>
                            {goToPage('/login/reset_password')},
                        child: Text(
                          '忘记密码',
                          style: TextStyle(
                            color: Color.fromRGBO(153, 153, 153, 1),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: isChinaPhoneLegal(phoneNumber) && password.isNotEmpty ? Color.fromRGBO(255, 96, 81, 1) : Color.fromRGBO(255, 207, 201, 1)),
                    child: Listener(
                      onPointerDown: _login,
                      child: Padding(
                        padding: EdgeInsets.only(top: 12, bottom: 12),
                        child: Center(
                          child: Text(
                            '确定',
                            style: TextStyle(
                              fontSize: 19,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            )),
      ),
    );
  }
}
