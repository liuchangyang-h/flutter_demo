import 'package:flutter/material.dart';
import 'package:flutterdemo/base/base_class.dart';

class BGContainer extends StatefulWidget {
  /// 背景颜色
  final Color bgColor;

  final Widget child;

  BGContainer({
    this.bgColor = BaseClass.kBackColor,
    this.child,
  });

  @override
  _BGContainerState createState() => _BGContainerState();
}

class _BGContainerState extends State<BGContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: BaseClass.screenW,
      height: BaseClass.screenH,
      color: widget.bgColor,
      child: widget.child,
    );
  }
}
