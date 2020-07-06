import 'package:flutter/material.dart';
import 'package:flutterdemo/base/base_class.dart';

///通用导航栏 默认显示 title backBtn 支持自定义bottom 和 actions
class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final PreferredSizeWidget bottom;
  final String title;
  BuildContext context;
  final List<Widget> actions;
  final TextStyle titleStyle;
  final Color backgroundColor;
  final String backImgName;
  final bool isBack;
  MyAppBar({
    this.bottom,
    this.title,
    this.context,
    this.actions,
    this.titleStyle,
    this.backgroundColor = BaseClass.kMainColor,
    this.backImgName,
    this.isBack: false,
  });
  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  // TODO: implement preferredSize

  Size get preferredSize => Size.fromHeight(this.bottom != null ? 91 : 45);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: new Text(
        widget.title ?? 'title',
        style: widget.titleStyle ?? new TextStyle(
          color: Colors.white,
          fontSize: BaseClass.kFont(17),
          fontWeight: FontWeight.bold,
        ),
      ),

      leading: widget.isBack ? FlatButton(
        child: Image(
          image: new AssetImage(widget.backImgName ?? Icons.arrow_back_ios),
          width: 9,
          height: 15,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ) : null,
      backgroundColor: widget.backgroundColor,
      elevation: 0,

      bottom: new AppBarBottom(
        child: widget.bottom,
      ),
      actions: widget.actions,
    );
  }
}

class AppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  AppBarBottom({
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 1,
            color: Color(0xFFE5E5E5),
          ),
          child ??
              SizedBox(
                height: 0,
              ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(this.child != null ? 47 : 1);
}