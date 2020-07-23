import 'package:city_pickers/city_pickers.dart';
import 'package:city_pickers/modal/result.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/base/base_class.dart';
import 'package:flutterdemo/controller/bg_container.dart';
import 'package:flutterdemo/controller/navigation.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  Result result = new Result();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '城市选择',
      ),
      body: BGContainer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //位置信息
              locationInformation(),
              //城市选择弹出
              reminder(),
            ],
          ),
        ),
      ),
    );
  }

  //位置信息
  locationInformation() {
    return Container(
      margin: EdgeInsets.only(top: 20,left: 10,right: 10),
      alignment: Alignment.center,
      width: BaseClass.screenW,
      color: Colors.white,
      child: Text(
        result.toString(),
        style: TextStyle(
          color: Colors.red,
          fontSize: BaseClass.kFont(15),
        ),
      ),
    );
  }

  //弹出框
  reminder() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: RaisedButton(
        onPressed: () async {
          Result tempResult = await CityPickers.showCityPicker(
            context: context,
            height: BaseClass.setHeight(300),
          );
          if (tempResult == null) {
            return;
          }
          setState(() {
            result = tempResult;
          });
        },
        child: Text(
          '城市选择',
        ),
      ),
    );
  }
}
