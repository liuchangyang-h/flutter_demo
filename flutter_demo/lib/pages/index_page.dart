import 'package:flutter/material.dart';
import 'package:flutterdemo/base/base_class.dart';
import 'package:flutterdemo/controller/navigation.dart';

class index_page extends StatefulWidget {
  @override
  _index_pageState createState() => _index_pageState();
}

class _index_pageState extends State<index_page>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

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
      ),
    );
  }
}
