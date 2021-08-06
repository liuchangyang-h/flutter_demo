import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutterdemo/base/base_class.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ChooseImagePage extends StatefulWidget {
  ///数据源
  List dataList;

  ///当前下标
  int curIndex;
  PageController controller;

  ChooseImagePage({Key key, @required this.dataList, this.curIndex})
      : super(key: key) {
    controller = PageController(initialPage: curIndex);
  }

  @override
  _ChooseImagePageState createState() =>
      _ChooseImagePageState(dataList: this.dataList, curIndex: this.curIndex);
}

class _ChooseImagePageState extends State<ChooseImagePage> {
  //数据源
  List dataList;

  //当前下标
  int curIndex;

  _ChooseImagePageState({Key key, this.dataList, this.curIndex}) {}

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              child: PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(widget.dataList[index]),
                    heroAttributes: null,
                  );
                },
                itemCount: widget.dataList.length,
                backgroundDecoration: null,
                pageController: widget.controller,
                enableRotation: true,
                onPageChanged: (index) {
                  setState(() {
                    curIndex = index;
                  });
                },
              ),
            ),
          ),
          Positioned(
            //图片index显示
            bottom: MediaQuery.of(context).padding.top + 15,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("${curIndex + 1}/${widget.dataList.length}",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
          Positioned(
            //右上角关闭按钮
            right: 10,
            top: MediaQuery.of(context).padding.top,
            child: IconButton(
              icon: Icon(
                Icons.close,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Positioned(
            bottom: 50,
            right: 20,
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                color: BaseClass.kMainColor,
                //设置四周圆角 角度
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              alignment: Alignment.center,
              child: FlatButton(
                onPressed: () {
//                  toIndexView();
                  _getHttp(curIndex);
                },
                child: Text(
                  '保存',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool> requestPermission() async {
    var status = await Permission.sensors.status;
    if (!status.isDenied) {
      return true;
    } else {
      EasyLoading.showInfo('需要存储权限');
      return false;
    }
  }

  //保存网络图
  _getHttp(int index) async {
    if (Platform.isIOS) {
      var response = await Dio().get(dataList[index],
          options: Options(responseType: ResponseType.bytes));
      final result =
          await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
      print(result);
      if (result) {
        EasyLoading.showSuccess('保存成功');
        Navigator.of(context).pop();
      } else {
        EasyLoading.showError('保存失败');
      }
    } else {
      if (await requestPermission()) {
        print('答应我');
        var response = await Dio().get(dataList[index],
            options: Options(responseType: ResponseType.bytes));
        final result = await ImageGallerySaver.saveImage(
            Uint8List.fromList(response.data));
        print(result);
        if (result.toString().length > 0) {
          EasyLoading.showSuccess('保存成功');
          Navigator.of(context).pop();
        } else {
          EasyLoading.showError('保存失败');
        }
      }
    }
  }
}
