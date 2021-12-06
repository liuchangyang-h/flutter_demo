import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemo/base/logUtil.dart';
import 'package:flutterdemo/router/BaseRouter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'base/base_class.dart';
import 'base/base_tabBar.dart';

void main() {
  realRunApp();
  configLoading();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)

    ///是否交互
    ..userInteractions = true;
}

void realRunApp() async {
  ///必要
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(MyApp());
}

class SpUtil {
  static SharedPreferences? token;
  static SharedPreferences? userId;
  static SharedPreferences? userInfo;
  static SharedPreferences? deviceToken;
  static SharedPreferences? isHadInstall;

  static Future<void> getInstance() async {
    userId = await SharedPreferences.getInstance();

    userInfo = await SharedPreferences.getInstance();

    token = await SharedPreferences.getInstance();

    deviceToken = await SharedPreferences.getInstance();

    isHadInstall = await SharedPreferences.getInstance();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  MyApp() {
    BaseRouter.setRouter(FluroRouter());
    BaseRouter.registerConfigureRoutes(BaseRouter.getRouter());
  }
  final easyload = EasyLoading.init();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      builder: () => MaterialApp(
        navigatorKey: BaseClass.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          platform: TargetPlatform.iOS,
          appBarTheme: AppBarTheme.of(context).copyWith(
            // 方式1
            brightness: Brightness.dark,
          ),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),

        ///初始化路由
        onGenerateRoute: BaseRouter.getRouter().generator,
        home: BaseTaBar(),
        builder: (context, widget) {
          widget = easyload(context, widget);
          widget = MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget,
          );
          return widget;
        },
      ),
    );
  }

  ///接受消息
  Future<void> receiveRemoteMsg(msg) async {
    Map<String, dynamic> infoMap;
    if ((msg != null) && (msg != '')) {
      infoMap = json.decode(msg);
      /**
       * type:
       * -1:表示存储deviceToken
       * */
    }
  }
}
