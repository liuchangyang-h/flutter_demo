import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterdemo/router/application.dart';
import 'package:flutterdemo/router/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base/base_class.dart';
import 'base/base_tabBar.dart';
import 'controller/navigation.dart';
import 'controller/notification.dart';

void main() {
  realRunApp();
  configLoading();
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

  ///注册fluro
  Router router = Router();

  ///绑定
  Routes.configureRoutes(router);

  ///全局赋值
  Application.router = router;
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
    return FlutterEasyLoading(
      child: MaterialApp(
        navigatorKey: BaseClass.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          platform: TargetPlatform.iOS,
        ),

        ///初始化路由
        onGenerateRoute: Application.router.generator,
        home: BaseTaBar(),
      ),
    );
  }
}
