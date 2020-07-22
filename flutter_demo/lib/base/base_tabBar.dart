import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterdemo/pages/index_page.dart';

import 'base_class.dart';

class BaseTaBar extends StatefulWidget {
  @override
  _BaseTaBarState createState() => _BaseTaBarState();
}

class _BaseTaBarState extends State<BaseTaBar> {

  int _tabIndex = 0;
  var tabImages;
  var appBarTitles = ['首页', '知识库', '快速提问', '交流', '我的'];

  /*
   * 存放三个页面，跟fragmentList一样
   */
  var _pageList;

  /*
   * 根据选择获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

/*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: BaseClass.kFont(14), color: BaseClass.kMainColor));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: BaseClass.kFont(14), color: const Color(0xff515151)));
    }
  }

  /*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  void initData() {
    /*
     * 初始化选中和未选中的icon
     */
    tabImages = [
      [
        getTabImage('images/tabbar/btn_index_normal-1.png'),
        getTabImage('images/tabbar/btn_index_selected-1.png')
      ],
      [
        getTabImage('images/tabbar/btn_knowledge_normal-1.png'),
        getTabImage('images/tabbar/btn_knowledge_selected.png')
      ],
      [
        getTabImage('images/tabbar/btn_put_normal-1.png'),
        getTabImage('images/tabbar/btn_put_selected-1.png')
      ],
      [
        getTabImage('images/tabbar/btn_communication_normal-1.png'),
        getTabImage('images/tabbar/btn_communication_selected-1.png')
      ],
      [
        getTabImage('images/tabbar/btn_me_normal-1.png'),
        getTabImage('images/tabbar/btn_me_selected-1.png')
      ],
    ];
    /*
     * 三个子界面
     */
    _pageList = [
      new IndexPage(),
      new IndexPage(),
      new IndexPage(),
      new IndexPage(),
      new IndexPage(),
    ];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ///字体大小适配初始化
    ScreenUtil.init(
      context,
      width: BaseClass.screenW,
      height: BaseClass.screenH,
      allowFontScaling: false,
    );

    //初始化数据
    initData();

    return Scaffold(
      body: IndexedStack(
        index: _tabIndex,
        children: _pageList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _tabIndex = 2;
          });
        },
        backgroundColor:
        (_tabIndex == 2) ? BaseClass.kMainColor : Colors.white,
        child: Image.asset(
          (_tabIndex == 2)
              ? 'images/tabbar/btn_put_selected-1.png'
              : 'images/tabbar/btn_put_normal-1.png',
          fit: BoxFit.cover,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
          BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
          BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2)),
          BottomNavigationBarItem(icon: getTabIcon(3), title: getTabTitle(3)),
          BottomNavigationBarItem(icon: getTabIcon(4), title: getTabTitle(4)),
        ],
        type: BottomNavigationBarType.fixed,
        fixedColor: Theme.of(context).primaryColor,
        //默认选中首页
        currentIndex: _tabIndex,
        //点击事件
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}

