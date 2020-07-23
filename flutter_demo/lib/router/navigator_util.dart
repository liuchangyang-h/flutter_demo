import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'application.dart';

///统一封装的路由跳转工具类
class NavigatorUtil {
  ///跳转页面,参数可选，动画可选，可以根据replace属性的值来决定是否销毁当前路由，这里使用iOS右侧进入的转场动画
  static void push(BuildContext context, String path,
      {bool replace = false, bool clearStack = false}) {
    unFocus();
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transition: TransitionType.native);
  }

  ///带返回值带跳转，比如在当前页面弹出对话框选择数据，返回到之前页面
  static void pushResult(
      BuildContext context, String path, Function(Object) function,
      {bool replace = false, bool clearStack = false}) {
    unFocus();
    Application.router
        .navigateTo(context, path,
            replace: replace,
            clearStack: clearStack,
            transition: TransitionType.native)
        .then((Object result) {
      /// 页面返回result为null
      if (result == null) {
        return;
      }
      function(result);
    }).catchError((dynamic error) {
      print('$error');
    });
  }

  /// 不带结果的返回
  static void goBack(BuildContext context) {
    /// 其实调用的就是 Navigator.pop(context);
    Application.router.pop(context);
  }

  /// 带结果的返回
  static void goBackWithParams(BuildContext context, result) {
    Navigator.pop(context, result);
  }

  static void unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
