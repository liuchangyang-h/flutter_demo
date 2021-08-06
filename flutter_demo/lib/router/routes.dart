import 'package:fluro/fluro.dart';
import 'package:flutterdemo/pages/LoginInfoPage.dart';
import 'package:flutterdemo/pages/city_page.dart';
import 'package:flutterdemo/pages/index_page.dart';
import 'package:flutterdemo/pages/location_page.dart';
import 'package:flutterdemo/pages/prompt_page.dart';
import 'package:flutterdemo/pages/refresh_page.dart';
import 'package:flutterdemo/pages/textField_page.dart';
import 'package:flutterdemo/pages/upload_page.dart';
import 'package:flutterdemo/router/IRouter.dart';
import 'package:flutterdemo/router/UserInfo.dart';

class Routes extends IRouter {
  ///APP级路由
  ///
  ///根路由，闪屏页
  static String root = "/";

  ///主页框架
  static String home = "/home";

  ///首页
  static String index = '/index';

  ///城市选择
  static String city = '/city';

  ///提示框
  static String prompt = '/prompt';

  ///下拉刷新
  static String refresh = '/refresh';

  ///输入框
  static String textField = '/textField';

  ///文件上传
  static String upload = '/upload';

  ///定位
  static String location = '/location';

  ///测试页面
  static String demo = '/demo';

  @override
  void initFluroRouter(FluroRouter router) {
    router.define(home, handler: Handler(handlerFunc: (_, __) => IndexPage()));

    router.define(index, handler: Handler(handlerFunc: (_, __) => IndexPage()));

    router.define(city, handler: Handler(handlerFunc: (_, __) => CityPage()));

    router.define(prompt,
        handler: Handler(handlerFunc: (_, __) => PromptPage()));

    router.define(refresh,
        handler: Handler(handlerFunc: (_, __) => RefreshPage()));

    router.define(textField,
        handler: Handler(handlerFunc: (_, __) => TextFieldPage()));

    router.define(upload,
        handler: Handler(handlerFunc: (_, __) => UploadPage()));

    router.define(location,
        handler: Handler(handlerFunc: (_, __) => LocationPage()));

    router.define(demo, handler: Handler(handlerFunc: (context, params) {
      final args = context.settings.arguments as UserInfo;
      return LoginInfoPage(args);
    }));
  }
}
