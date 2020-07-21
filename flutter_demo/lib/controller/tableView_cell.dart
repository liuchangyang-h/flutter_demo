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

  TableViewCell({
    this.callBack,
    this.item,
    this.isArrow: true,
    this.index,
    this.height = 44.0,
    this.titleColor = Colors.black,
    this.titleFont = 15,
    this.arrowColor = Colors.black,
    this.isClick: true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          if(isClick){
            this.callBack(this.index);
          }
        },
        child: Container(
          width: BaseClass.screenW,
          height: this.height,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                  width: BaseClass.kLineHeight, color: BaseClass.kLineColor),
            ),
          ),
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ///图片
                  BaseExtend.isValue(item['image'])
                      ? Container(
                          margin:
                              EdgeInsets.only(left: 5, top: 10, bottom: 10),
                          height: height - 10 * 2,
                          width: height - 10 * 2,
                          child: Image(
                            image: AssetImage(item['image']),
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(),

                  ///内容文字
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    alignment: Alignment.centerLeft,
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
                      right: 10,
                      child: Container(
                        height: height,
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: arrowColor,
                          size: 30,
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
