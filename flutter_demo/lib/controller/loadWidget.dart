import 'package:flutter/material.dart';
import 'package:flutterdemo/controller/processWidget.dart';

enum _LoadType {
  loading,
  success,
  info,
  error,
  process,
}

class LoadWidget {
  static String _message;
  static double _process;

  static OverlayEntry _overlayEntry;
  static _LoadType _loadType;
  static bool _isShow = false;

  static _loadingWidget() {
    Widget widget = Container(
      width: 100,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.black26),
        ),
      ),
    );
    return _loadSuperWidget(widget);
  }

  static _loadSuccessWidget() {
    Widget widget = Image.asset(
      "images/icon_load_success.png",
      width: 50.0,
      height: 50.0,
    );
    return _loadSuperWidget(widget);
  }

  static _loadInfoWidget() {
    Widget widget = Image.asset(
      "images/icon_load_info.png",
      width: 50.0,
      height: 50.0,
    );
    return _loadSuperWidget(widget);
  }

  static _loadErrorWidget() {
    Widget widget = Image.asset(
      "images/icon_load_error.png",
      width: 50.0,
      height: 50.0,
    );
    return _loadSuperWidget(widget);
  }

  static _loadProcessWidget() {
    Widget widget = processWidget(processPer: _process);
    return _loadSuperWidget(widget);
  }

  static _loadSuperWidget(Widget childWidget) {
    Widget widget = Container(
      color: Colors.black12,
      padding: EdgeInsets.all(30),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            color: Colors.black38,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: childWidget,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    _message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    return widget;
  }

  static _initOverlayEntry() {
    _isShow = true;

    _overlayEntry = OverlayEntry(builder: (context) {
      switch (_loadType) {
        case _LoadType.loading:
          return _loadingWidget();
          break;
        case _LoadType.success:
          return _loadSuccessWidget();
          break;
        case _LoadType.info:
          return _loadInfoWidget();
          break;
        case _LoadType.error:
          return _loadErrorWidget();
          break;
        case _LoadType.process:
          return _loadProcessWidget();
          break;
      }
    });
    return _overlayEntry;
  }

  static _initAutoDismissAnimal() {
    Future.delayed(Duration(milliseconds: 1500)).then((value) {
      dismiss();
    });
  }

  static showLoading(BuildContext context, {String message = "加载中"}) {
    dismiss();

    _loadType = _LoadType.loading;
    _message = message;

    Overlay.of(context).insert(_initOverlayEntry());
  }

  static showSuccess(BuildContext context, {String message = "加载成功"}) {
    dismiss();

    _loadType = _LoadType.success;
    _message = message;

    Overlay.of(context).insert(_initOverlayEntry());

    _initAutoDismissAnimal();
  }

  static showInfo(BuildContext context, {String message = "加载信息"}) {
    dismiss();

    _loadType = _LoadType.info;
    _message = message;

    Overlay.of(context).insert(_initOverlayEntry());

    _initAutoDismissAnimal();
  }

  static showError(BuildContext context, {String message = "加载失败"}) {
    dismiss();

    _loadType = _LoadType.error;
    _message = message;

    Overlay.of(context).insert(_initOverlayEntry());

    _initAutoDismissAnimal();
  }

  static showProcess(BuildContext context, {String message = "加载中"}) {
    dismiss();

    _loadType = _LoadType.process;
    _process = 0.0;
    _message = message;

    Overlay.of(context).insert(_initOverlayEntry());
  }

  static updateProcess(double process) {
    if (_loadType == _LoadType.process) {
      _process = process;

      _overlayEntry.markNeedsBuild();

      return;
    }
  }

  static dismiss() {
    if (_isShow) {
      _isShow = false;
      _overlayEntry.remove();
      _overlayEntry = null;
    }
  }
}
