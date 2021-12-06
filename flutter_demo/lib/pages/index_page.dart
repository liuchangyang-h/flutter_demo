import 'package:flutter/material.dart';
import 'package:flutterdemo/controller/bg_container.dart';
import 'package:flutterdemo/controller/navigation.dart';
import 'package:flutterdemo/controller/tableView_cell.dart';
import 'package:flutterdemo/router/NavigatorUtils.dart';
import 'package:flutterdemo/router/UserInfo.dart';
import 'package:flutterdemo/router/routes.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  ///数组
  List aryArray = [
    {
      'title': '输入框',
      'image': '',
    },
    {
      'title': '图片上传',
      'image': '',
    },
    {
      'title': '弹出提示框',
      'image': '',
    },
    {
      'title': '拉下刷新',
      'image': '',
    },
    {
      'title': '城市选择',
      'image': '',
    },
    {
      'title': '地理位置',
      'image': '',
    },
    {
      'title': '测试页面',
      'image': '',
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
//      RoutePush.push(context, TextFieldPage());
      // Navigator.of(context).push(
      //   FadeRoute(
      //     page: TextFieldPage(),
      //   ),
      // );
      NavigatorUtils.push(context, Routes.textField);
    } else if (index == 1) {
//      RoutePush.push(context, UploadPage());
      NavigatorUtils.push(context, Routes.upload);
    } else if (index == 2) {
      NavigatorUtils.push(context, Routes.prompt);
    } else if (index == 3) {
      NavigatorUtils.push(context, Routes.refresh);
    } else if (index == 4) {
      NavigatorUtils.push(context, Routes.city);
    } else if (index == 5) {
      NavigatorUtils.push(context, Routes.location);
    } else if (index == 6) {
      UserInfo userInfo = UserInfo();
      userInfo.email = "xiaotimel@163.com";
      userInfo.name = "猪猪";
      NavigatorUtils.pushArgument(context, Routes.demo, userInfo);
    }
  }
}
