import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base/base_class.dart';
import 'base/base_tabBar.dart';
import 'controller/navigation.dart';
import 'controller/notification.dart';

void main() {
  realRunApp();
}

void realRunApp() async {
  //必要
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(MyApp());
}

class SpUtil {
  static SharedPreferences token;
  static SharedPreferences userId;
  static SharedPreferences userInfo;
  static SharedPreferences deviceToken;
  static SharedPreferences isHadInstall;

  static Future<String> getInstance() async {
    userId = await SharedPreferences.getInstance();

    userInfo = await SharedPreferences.getInstance();

    token = await SharedPreferences.getInstance();

    deviceToken = await SharedPreferences.getInstance();

    isHadInstall = await SharedPreferences.getInstance();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      navigatorKey: BaseClass.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: base_tabBar(),
    );
  }
}
