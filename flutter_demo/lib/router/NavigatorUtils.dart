import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/base/logUtil.dart';
import 'package:flutterdemo/router/BaseRouter.dart';

class NavigatorUtils {
  static void push(BuildContext context, String path,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    BaseRouter.getRouter().navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transition: TransitionType.native);
  }

  static void pushResult(
      BuildContext context, String path, Function(Object) function,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    BaseRouter.getRouter()
        .navigateTo(context, path,
            replace: replace,
            clearStack: clearStack,
            transition: TransitionType.native)
        .then((value) {
      if (value == null) {
        return;
      }
      function(value);
    }).catchError((onError) {
      log("$onError");
    });
  }

  static void pushArgumentResult(BuildContext context, String path,
      Object argument, Function(Object) function,
      {bool replace = false, bool clearStack = false}) {
    BaseRouter.getRouter()
        .navigateTo(context, path,
            routeSettings: RouteSettings(arguments: argument),
            replace: replace,
            clearStack: clearStack,
            transition: TransitionType.native)
        .then((value) {
      if (value == null) {
        return;
      }
      function(value);
    }).catchError((onError) {
      log("$onError");
    });
  }

  static void pushArgument(BuildContext context, String path, Object argument,
      {bool replace = false, bool clearStack = false}) {
    BaseRouter.getRouter().navigateTo(context, path,
        routeSettings: RouteSettings(arguments: argument),
        replace: replace,
        clearStack: clearStack,
        transition: TransitionType.native);
  }

  static void goBack(BuildContext context) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }

  static void goBackWithParams(BuildContext context, result) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context, result);
  }

  // static String changeToNavigatorPath(String registerPath,
  //     {Map<String, Object> params}) {
  //   if (params == null || params.isEmpty) {
  //     return registerPath;
  //   }
  //   StringBuffer bufferStr = StringBuffer();
  //   params.forEach((key, value) {
  //     bufferStr
  //       ..write(key)
  //       ..write("=")
  //       ..write(Uri.encodeComponent(value))
  //       ..write("&");
  //   });
  //   String paramStr = bufferStr.toString();
  //   paramStr = paramStr.substring(0, paramStr.length - 1);
  //   log("传递的参数  $paramStr");
  //   return "$registerPath?$paramStr";
  // }

  static void goWebViewPage(BuildContext context, String title, String url) {}
}