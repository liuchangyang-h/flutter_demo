import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutterdemo/controller/bg_container.dart';
import 'package:flutterdemo/controller/navigation.dart';

class PromptPage extends StatefulWidget {
  @override
  _PromptPageState createState() => _PromptPageState();
}

class _PromptPageState extends State<PromptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '提示框',
      ),
      body: BGContainer(
        child: SingleChildScrollView(
          child: loadView(),
        ),
      ),
    );
  }

  ///弹出框
  loadView() {
    return Container(
      child: Column(
        children: <Widget>[
          //show
          Container(
            child: RaisedButton(
              onPressed: () {
                EasyLoading.show();
              },
              child: Text(
                'show',
              ),
            ),
          ),
          //showProgress
          Container(
            child: RaisedButton(
              onPressed: () {
                EasyLoading.showProgress(0.3, status: 'downloading...');
              },
              child: Text(
                'downloading',
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: () {
                EasyLoading.showSuccess('Great Success!');
              },
              child: Text(
                'Success',
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: () {
                EasyLoading.showError('Failed with Error');
              },
              child: Text(
                'Error',
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: () {
                EasyLoading.showInfo('Useful Information.');
              },
              child: Text(
                'Information',
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: () {
                EasyLoading.showToast('Toast');
              },
              child: Text(
                'Toast',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
