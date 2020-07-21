import 'package:flutter/material.dart';
import 'package:flutterdemo/base/base_class.dart';
import 'package:flutterdemo/controller/navigation.dart';
import 'package:flutterdemo/controller/textField.dart';

class TextFieldPage extends StatefulWidget {
  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {

  TextEditingController _contentTf = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        BaseClass.closeKeyBorder();
      },
      child: Scaffold(
        appBar: MyAppBar(
          title: '输入框',
        ),
        body: Container(
          height: BaseClass.screenH,
          color: BaseClass.kBackColor,
          child: SingleChildScrollView(
            child: textField(),
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
      child: Container(
        margin: EdgeInsets.only(left: 5,right: 5),
        child:  MyTextField(
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
      ),
    );
  }
}
