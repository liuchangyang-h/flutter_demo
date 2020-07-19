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
  final double backW;
  final double backH;
  final bool isBack;
  final Color backColors;
  MyAppBar({
    this.bottom,
    this.title,
    this.context,
    this.actions,
    this.titleStyle,
    this.backgroundColor = BaseClass.kMainColor,
    this.backImgName,
    this.backW = 9.0,
    this.backH = 15.0,
    this.isBack: false,
    this.backColors = Colors.white,
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
      iconTheme: IconThemeData(
        color: widget.backColors,
      ),
      title: Text(
        widget.title ?? 'title',
        style: widget.titleStyle ?? TextStyle(
          color: Colors.white,
          fontSize: BaseClass.kFont(17),
          fontWeight: FontWeight.bold,
        ),
      ),

      leading: widget.isBack ? FlatButton(
        child: Image(
          image: AssetImage(widget.backImgName ?? Icons.arrow_back_ios),
          width: widget.backW,
          height: widget.backH,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ) : null,
      backgroundColor: widget.backgroundColor,
      elevation: 0,

      bottom: AppBarBottom(
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