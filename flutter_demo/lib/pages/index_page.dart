import 'package:flutter/material.dart';
import 'package:flutterdemo/base/base_class.dart';
import 'package:flutterdemo/controller/navigation.dart';
import 'package:flutterdemo/controller/textField.dart';

class index_page extends StatefulWidget {
  @override
  _index_pageState createState() => _index_pageState();
}

class _index_pageState extends State<index_page>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  TextEditingController _contentTf = TextEditingController();

  @override
  void initState() {
    super.initState();

    ///进啦的时候执行
    ///with AutomaticKeepAliveClientMixin 首页作为底部的tab为了防止每次点击都会加载所以加了这句话
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '首页',
      ),
      body: Container(
        color: BaseClass.kBackColor,
        margin: EdgeInsets.only(left: 10,right: 10),
        child: Container(
          width: BaseClass.screenW - 20,
          height: 200,
          child: MyTextField(
            maxLines: null,
            controller: _contentTf,
            style: new TextStyle(
              fontSize: 15.0,
            ),
            decoration: InputDecoration(
              hintText: '请输入内容（600字以内）',
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              hintMaxLines: 6,
//              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
//            cursorColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}
