import 'package:flutter/material.dart';
import 'package:quick_loan_demo/services/login.dart';
import 'package:quick_loan_demo/utils/tools.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key key}) : super(key: key);

  @override
  _ResetPassword createState() => _ResetPassword();
}

class _ResetPassword extends State<ResetPassword> {
  LoginService loginService = LoginService();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  String _password = '';
  String _confirmPassword = '';

  initState() {
    super.initState();
    _passwordController.addListener(() {
      this.setState(() {
        _password = _passwordController.text;
      });
    });

    _confirmPasswordController.addListener(() {
      this.setState(() {
        _confirmPassword = _confirmPasswordController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('即客贷'),
        backgroundColor: Color.fromRGBO(255, 96, 81, 1),
        leading: IconButton(
          icon: Image(image: AssetImage("images/back.png"), width: 18.0),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '设置登录密码',
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 57),
                child: Row(
                  children: <Widget>[
                    Text(
                      '请设置新的登录密码',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(51, 51, 51, 1),
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                autofocus: false,
                obscureText: true,
                controller: _passwordController,
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromRGBO(51, 51, 51, 1),
                ),
                decoration: InputDecoration(
                  counterText: '',
                  hintText: "请输入6位以上新密码",
                  hintStyle: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(153, 153, 153, 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(255, 89, 65, 1)),
                  ),
                ),
              ),
              TextField(
                autofocus: false,
                obscureText: true,
                controller: _confirmPasswordController,
                style: TextStyle(
                  fontSize: 24,
                  color: Color.fromRGBO(51, 51, 51, 1),
                ),
                decoration: InputDecoration(
                  counterText: '',
                  hintText: "请再次输入新密码",
                  hintStyle: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(153, 153, 153, 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(255, 89, 65, 1)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 63),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    color: _password.length >= 6 && _confirmPassword.length >= 6 ? Color.fromRGBO(255, 96, 81, 1) : Color.fromRGBO(255, 207, 201, 1),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: Listener(
                        onPointerDown: (event) {
                          ToolsFunction.goToPage(context, '/home', {});
                        },
                        child: Column(
                          children: <Widget>[
                            Text(
                              '修改并登录',
                              style: TextStyle(
                                fontSize: 19,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
