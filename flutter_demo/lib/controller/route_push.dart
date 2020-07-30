import 'package:flutter/material.dart';

class RoutePush {
  /// 设置一次 context 方便后面
  static BuildContext _context;

  static set context(BuildContext value) {
    _context = value;
  }

  static pushWithLink(String link) {
    if (_context == null) {
      print("context 为空");
      return;
    }

    /// query 参数
    final params = Uri.dataFromString(link).queryParameters;

    print("未实现的路由：" + link);
  }

  /// push 新页面
  static push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  /// iOS 从底部向上出来的页面
  static present(BuildContext context, Widget page) {
    Navigator.of(context).push(
        MaterialPageRoute(fullscreenDialog: true, builder: (context) => page));
  }
}

// ///渐渐淡出
// class FadeRoute extends PageRouteBuilder {
//   final Widget page;

//   FadeRoute({this.page})
//       : super(
//     pageBuilder: (
//         BuildContext context,
//         Animation<double> animation,
//         Animation<double> secondaryAnimation,
//         ) =>
//     page,
//     transitionsBuilder: (
//         BuildContext context,
//         Animation<double> animation,
//         Animation<double> secondaryAnimation,
//         Widget child,
//         ) =>
//         FadeTransition(
//           opacity: animation,
//           child: child,
//         ),
//   );
// }