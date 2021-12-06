import 'package:flutter/material.dart';
import 'package:flutterdemo/controller/bg_container.dart';
import 'package:flutterdemo/controller/navigation.dart';
import 'package:flutterdemo/router/UserInfo.dart';

class LoginInfoPage extends StatefulWidget {
  UserInfo userInfo;
  LoginInfoPage(this.userInfo);

  @override
  _LoginInfoPageState createState() => _LoginInfoPageState();
}

class _LoginInfoPageState extends State<LoginInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '测试页面',
      ),
      body: BGContainer(
        child: Text(
          '用户名称' + widget.userInfo.name + "邮箱" + widget.userInfo.email,
        ),
      ),
    );
  }
}
