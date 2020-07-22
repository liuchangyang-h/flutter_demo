import 'package:flutter/material.dart';
import 'package:flutterdemo/controller/bg_container.dart';
import 'package:flutterdemo/controller/navigation.dart';
import 'package:flutterdemo/controller/route_push.dart';
import 'package:flutterdemo/controller/tableView_cell.dart';
import 'city_page.dart';
import 'prompt_page.dart';
import 'refresh_page.dart';
import 'textField_page.dart';
import 'upload_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  ///数组
  List aryArray = [
    {
      'title': '输入框',
    },
    {
      'title': '图片上传',
    },
    {
      'title': '弹出提示框',
    },
    {
      'title': '拉下刷新',
    },
    {
      'title': '城市选择',
    },
  ];

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
      body: BGContainer(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return TableViewCell(
              item: this.aryArray[index],
              index: index,
              callBack: callBack,
            );
          },
          itemCount: this.aryArray.length,
        ),
      ),
    );
  }

  //回调
  void callBack(index) {
    print('点击了:${index}');
    if (index == 0) {
      RoutePush.push(context, TextFieldPage());
    } else if (index == 1) {
      RoutePush.push(context, UploadPage());
    } else if (index == 2) {
      RoutePush.push(context, PromptPage());
    } else if (index == 3) {
      RoutePush.push(context, RefreshPage());
    } else if (index == 4) {
      RoutePush.push(context, CityPage());
    }
  }
}
