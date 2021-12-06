import 'package:fluro/fluro.dart';
import 'package:flutterdemo/router/IRouter.dart';
import 'package:flutterdemo/router/routes.dart';

class BaseRouter {
  static FluroRouter _mFluroRouter = FluroRouter.appRouter;

  static FluroRouter getRouter() {
    return _mFluroRouter;
  }

  static void setRouter(FluroRouter router) {
    _mFluroRouter = router;
  }

  static List<IRouter> _mListRouter = [];
  static void registerConfigureRoutes(FluroRouter router) {
    if (router == null) {
      throw Exception("fluroRouter is null, please init router");
    }

    // router.notFoundHandler = Handler(handlerFunc:
    //     (BuildContext context, Map<String, List<String>> parameters) {
    //   log("页面没有注册，找不到该页面  ");
    //   return RouteNotFound();
    // });

    _mListRouter.clear();
    //添加模块路由
    _mListRouter.add(Routes());

    _mListRouter.forEach((element) {
      element.initFluroRouter(router);
    });
  }
}
