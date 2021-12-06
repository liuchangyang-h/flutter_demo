import 'package:flutter/material.dart';
import 'package:flutterdemo/base/base_class.dart';
import 'package:flutterdemo/base/base_extend.dart';

class TableViewCell extends StatelessWidget {
  ///点击回调
  final callBack;

  ///内容
  final item;

  ///是否需要箭头
  final bool isArrow;

  ///当前位置
  final int index;

  ///高度
  final double height;

  ///字体颜色
  final Color titleColor;

  ///字体大小
  final int titleFont;

  ///箭头颜色
  final Color arrowColor;

  ///是否添加点击事件
  final bool isClick;

  ///图标
  final IconData icon;

  TableViewCell({
    this.callBack,
    this.item,
    this.isArrow: true,
    required this.index,
    this.height = 44.0,
    this.titleColor = Colors.black,
    this.titleFont = 15,
    this.arrowColor = Colors.grey,
    this.isClick: true,
    this.icon = Icons.arrow_forward_ios,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          if (isClick) {
            this.callBack(this.index);
          }
        },
        child: Container(
          width: BaseClass.screenW,
          height: BaseClass.setHeight(height),
          decoration: BoxDecoration(
              // color: Colors.white,
              // border: Border(
              //   bottom: BorderSide(
              //       width: BaseClass.kLineHeight, color: BaseClass.kLineColor),
              // ),
              ),
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ///图片
                  Container(
                    width: 20,
                  ),

                  (BaseExtend.isValue(item['image']))
                      ? Container(
                          margin: EdgeInsets.only(left: 5, top: 10, bottom: 10),
                          height: 30,
                          width: 30,
                          child: Image(
                            image: AssetImage(item['image']),
                            fit: BoxFit.fill,
                          ),
                        )
                      : Container(),

                  ///内容文字
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      item['title'],
                      style: TextStyle(
                        color: titleColor,
                        fontSize: BaseClass.kFont(titleFont),
                      ),
                    ),
                  ),
                ],
              ),
              isArrow
                  ? Positioned(
                      right: 20,
                      child: Container(
                        height: BaseClass.setHeight(height),
                        child: Icon(
                          icon,
                          color: arrowColor,
                          size: 16,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
