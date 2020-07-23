import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'base_refresh.dart';

class BaseClass {
  /// mark ---------------------------------------- System ----------
  static final GlobalKey<NavigatorState> navigatorKey = new GlobalKey();

  ///获取当前的context
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);

  ///屏幕宽度
  static double screenW = mediaQuery.size.width;

  ///屏幕高度
  static double screenH = mediaQuery.size.height;

  ///导航高
  static double kNavigationHeight = kToolbarHeight;

  ///状态栏高度
  static double kTopSafeHeight = mediaQuery.padding.top;

  ///底部tab导航高
  static double kTabbarHeight = kBottomNavigationBarHeight;

  /// 底部安全区
  static double kBottomSafeHeight = mediaQuery.padding.bottom;

  ///字体适配
  static kFont(x) {
    return ScreenUtil().setSp(x);
  }

  ///根据UI设计的设备宽度适配
  static setWidth(x){
    return ScreenUtil().setWidth(x);
  }

  ///根据UI设计的设备高度适配
  static setHeight(x){
    return ScreenUtil().setHeight(x);
  }

  ///关闭键盘
  static closeKeyBorder() {
    FocusScope.of(navigatorKey.currentState.overlay.context)
        .requestFocus(FocusNode());
  }

  /// mark ---------------------------------------- App ----------

  ///默认背景颜色
  static const kBackColor = Color(0xFFF0F1F4);

  ///主题颜色
  static const kMainColor = Color(0xFF0C60A2);

  ///基础线颜色
  static const kLineColor = Color(0xFFC1C1C1);

  ///基础线高
  static double kLineHeight = 1.0 / ScreenUtil.pixelRatio;

  ///网络默认图
  static const kImage = 'images/Placeholder.png';

  /// mark ---------------------------------------- Key ----------

  //高德地图
  static const kMap_Key = '580ee6f1a68052bdd4944af1b9ec93f3';

  /// mark ---------------------------------------- Local ----------

  ///是否已经安装过程序
  static const kLocal_IsHadInstall = 'kLocal_IsHadInstall';

  ///用户信息
  static const kLocal_UserInfo = 'userInfo';

  ///toekn
  static const kLocal_Token = 'token';

  ///userId
  static const kLocal_UserId = 'userId';

  ///deviceToken
  static const kLocal_DeviceToken = 'deviceToken';

  /// mark ---------------------------------------- Noti ----------

  ///通知执行检测是否有新信息
  static const kNotification_DetectionNews = 'detectionNews';

  /// mark ---------------------------------------- Refresh ----------

  static final PullToRefreshStyle pullToRefreshStyle = PullToRefreshStyle();

  /// mark ---------------------------------------- End ----------
}
