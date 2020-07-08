import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/base/base_class.dart';
import 'package:flutterdemo/base/base_extend.dart';
import 'package:flutterdemo/base/base_netUrl.dart';
import 'package:flutterdemo/base/base_netWork.dart';
import 'package:flutterdemo/controller/loadWidget.dart';
import 'package:flutterdemo/controller/navigation.dart';
import 'package:flutterdemo/controller/textField.dart';
import 'package:flutterdemo/controller/upload_file.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo/photo.dart';
import 'package:video_player/video_player.dart';

class index_page extends StatefulWidget {
  @override
  _index_pageState createState() => _index_pageState();
}

class _index_pageState extends State<index_page>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  TextEditingController _contentTf = TextEditingController();

  VideoPlayerController _videoPlayerController;

  ///弹出选择（0默认不选，1表示相机、2表示单图相册、3表示录制视频、4表示多图相册）
  int type = 0;

  //存放本地路径
  List fileImages = List();

  //存放网络路径
  List urlImages = List();

  //用于定位图片上传位置
  int locationImg = 0;

  @override
  void initState() {
    super.initState();

    ///进啦的时候执行
    ///with AutomaticKeepAliveClientMixin 首页作为底部的tab为了防止每次点击都会加载所以加了这句话
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '首页',
      ),
      body: Container(
        height: BaseClass.screenH,
        color: BaseClass.kBackColor,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                textField(),
                imageOrVideo(),
                imageShow(),
                releaseView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///输入框
  textField() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: MyTextField(
        maxLines: null,
        maxLength: 600,
        controller: _contentTf,
        style: new TextStyle(
          fontSize: BaseClass.kFont(15),
        ),
        decoration: InputDecoration(
          hintText: '请输入内容（600字以内）',
          labelStyle: TextStyle(
            color: Colors.white,
          ),
          hintMaxLines: 6,
//              hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
//            cursorColor: Colors.grey,
      ),
    );
  }

  ///拍照、录屏、获取相册
  imageOrVideo() {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: 10),
      child: RaisedButton(
        color: BaseClass.kMainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Text(
          '拍照、录屏、多图选择及图片选择',
          style: TextStyle(
            color: Colors.white,
            fontSize: BaseClass.kFont(16),
          ),
        ),
        onPressed: () {
          print('点击了');
          getItemPicture();
        },
      ),
    );
  }

  ///展示
  imageShow() {
    ///0默认不选，1表示相机、2表示单图相册、3表示录制视频、4表示多图相册
    if (this.type == 0) {
      return Container();
    } else if (this.type == 1) {
      return Container(
        margin: EdgeInsets.only(top: 10, left: 20, right: 20),
        width: BaseClass.screenW - 40,
        height: 150,
        color: Colors.grey,
        child: Stack(
          children: <Widget>[
            Container(
              child: Image.asset(
                fileImages[0],
                width: BaseClass.screenW - 40,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              right: 10,
              child: Container(
                alignment: Alignment.center,
                width: 35,
                height: 30,
                child: FlatButton(
                  onPressed: () {
                    print('删除');
                    setState(() {
                      this.type = 0;
                      fileImages.clear();
                    });
                  },
                  child: Icon(
                    Icons.clear,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (this.type == 2) {
      return Container(
        margin: EdgeInsets.only(top: 10, left: 20, right: 20),
        width: BaseClass.screenW - 40,
        height: 150,
        color: Colors.grey,
        child: Stack(
          children: <Widget>[
            Container(
              child: Image.asset(
                fileImages[0],
                width: BaseClass.screenW - 40,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              right: 10,
              child: Container(
                alignment: Alignment.center,
                width: 35,
                height: 30,
                child: FlatButton(
                  onPressed: () {
                    print('删除');
                    setState(() {
                      this.type = 0;
                      fileImages.clear();
                    });
                  },
                  child: Icon(
                    Icons.clear,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (this.type == 3) {
      return Container(
        margin: EdgeInsets.only(top: 10, left: 20, right: 20),
        width: MediaQuery.of(context).size.width - 40,
        height: 150,
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 150,
              child: AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              ),
            ),
            Positioned(
              top: 0,
              right: 10,
              child: Container(
                alignment: Alignment.center,
                width: 35,
                height: 30,
                child: FlatButton(
                  onPressed: () {
                    print('删除');
                    setState(() {
                      this.type = 0;
                      fileImages.clear();
                    });
                  },
                  child: Icon(
                    Icons.clear,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (this.type == 4) {
      return GridView.count(
        //水平子Widget之间间距
        crossAxisSpacing: 10.0,
        //垂直子Widget之间间距
        mainAxisSpacing: 10.0,
        //GridView内边距
        padding: EdgeInsets.all(1.0),
        //一行的Widget数量
        crossAxisCount: 4,
        shrinkWrap: true,
        //为true可以解决子控件必须设置高度的问题
        //禁止滑动
        physics: const NeverScrollableScrollPhysics(),
        //子widge列表
        children: getImagesist(),
      );
    }
    return Container();
  }

  ///发布
  releaseView() {
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: 10),
      child: RaisedButton(
        color: BaseClass.kMainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Text(
          '发布图片或视频到OSS',
          style: TextStyle(
            color: Colors.white,
            fontSize: BaseClass.kFont(16),
          ),
        ),
        onPressed: () {
          print('点击了');
          urlImages.clear();
          requestImageToken('interact/quickAsk/');
        },
      ),
    );
  }

  //图片
  List<Widget> getImagesist() {
    List<Widget> widgetList = new List();
    for (int i = 0; i < fileImages.length; i++) {
      String string = fileImages[i];
      widgetList.add(showImageView(string, i));
    }
    return widgetList;
  }

  //图片展示
  Widget showImageView(item, int row) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            child: Image.asset(
              item,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            left: 50,
            child: Container(
              alignment: Alignment.center,
              width: 35,
              height: 30,
              child: FlatButton(
                onPressed: () {
                  print('删除');
                  if (BaseExtend.isValue(fileImages)) {
                    setState(() {
                      fileImages.removeAt(row);
                      if (fileImages.length <= 0) {
                        this.type = 0;
                      }
                    });
                  }
                },
                child: Icon(
                  Icons.clear,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getItemPicture() {
    showDemoActionSheet(
      context: context,
      child: CupertinoActionSheet(
        title: const Text('图片与视频'),
        //message: const Text('Please select the best mode from the options below.'),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: const Text('相机'),
            onPressed: () {
              Navigator.pop(context, '相机');
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('相册'),
            onPressed: () {
              Navigator.pop(context, '相册');
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('视频'),
            onPressed: () {
              Navigator.pop(context, '视频');
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('多图选择'),
            onPressed: () {
              Navigator.pop(context, '多图选择');
            },
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('取消'),
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context, '取消');
          },
        ),
      ),
    );
  }

  void showDemoActionSheet({BuildContext context, Widget child}) {
    showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) => child,
    ).then((String value) {
      if (value != null) {
        if (value == "相机") {
          getImageByCamera();
        } else if (value == "相册") {
          getImageByGallery();
        } else if (value == '视频') {
          getVideo();
        } else if (value == '多图选择') {
          multipleChoice();
        }
      }
    });
  }

  void getImageByCamera() async {
    this.fileImages.clear();
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      this.type = 1;
      this.fileImages.add(image.path);
    });
  }

  void getImageByGallery() async {
    this.fileImages.clear();
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (BaseExtend.isValue(image.path)) {
      this.fileImages.clear();
      setState(() {
        this.type = 2;
        this.fileImages.add(image.path);
      });
    }
  }

  void getVideo() async {
    File video = await ImagePicker.pickVideo(source: ImageSource.camera);
    if (BaseExtend.isValue(video.path)) {
      fileImages.clear();
      _videoPlayerController = VideoPlayerController.file(video)
        ..initialize().then((_) {
          setState(() {
            this.type = 3;
            fileImages.add(video.path);
          });
          _videoPlayerController.pause();
        });
    }
  }

  void multipleChoice() async {
    if (this.type != 4) {
      fileImages.clear();
    }
    final result = await PhotoPicker.pickAsset(
        context: context,
        maxSelected: 9 - fileImages.length,
        pickType: PickType.onlyImage);

    if (BaseExtend.isValue(result)) {
      for (var e in result) {
        var file = await e.file;
        fileImages.add(file.path);
      }

      setState(() {
        this.type = 4;
      });
    }
  }

  publishBtnClick() {
    urlImages.clear();
    if (!BaseExtend.isValue(fileImages)) {
      LoadWidget.showInfo(context, message: '请选择图片或者视频');
      return;
    }
  }

  //获取token,dio上传图片
  void requestImageToken(String dir) {
    LoadWidget.showLoading(context);

    String filePath = fileImages[locationImg];

    var today = DateTime.now();

    BaseNetWork.requestWithUrl(
      NetUrl.kur_Token_AliOssToken,
      {
        'dir': dir +
            today.year.toString() +
            '/' +
            today.month.toString() +
            '/' +
            today.day.toString() +
            '/',
      },
      (int code, String message, Object data) async {
        if (code == BaseNetWork.kCodeSuccess) {
          UploadFile.requestOssUrl(
            filePath,
            data,
            (int code, String message, String data) {
              if (code == BaseNetWork.kCodeSuccess) {
                urlImages.add(data);
                if (urlImages.length == fileImages.length) {
                  print('结束');
                  print('打印出来看看网络地址:${urlImages}');
                  LoadWidget.showSuccess(context,message: '上传成功！');
                } else {
                  locationImg = locationImg + 1;
                  requestImageToken(dir);
                }
              } else {
                if (urlImages.length == fileImages.length) {
                  print('结束');
                  print('打印出来看看网络地址:${urlImages}');
                  LoadWidget.showSuccess(context,message: '上传成功！');
                } else {
                  locationImg = locationImg + 1;
                  requestImageToken(dir);
                }
              }
            },
            (error) {
              locationImg = locationImg;
              requestImageToken(dir);
            },
          );
        } else {
          LoadWidget.showInfo(context, message: message);
        }
      },
      (error) {
        LoadWidget.showError(context);
      },
    );
  }
}
