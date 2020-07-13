import 'package:flutter/material.dart';
import 'package:flutterdemo/base/base_class.dart';
import 'package:flutterdemo/controller/navigation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshPage extends StatefulWidget {
  @override
  _RefreshPageState createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {

  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  //下拉刷新的方法
  Future<Null> _onListRefresh(BuildContext context) async {
    _refreshController.refreshCompleted();
  }

  //分页加载更多的方法
  Future<Null> _onListLoadMore(BuildContext context) async {
    _refreshController.loadComplete();
  }

  ///初始化数组
  List dataList = [
    '你好',
    '不好',
    '不好',
    '不好',
    '不好',
    '不好',
    '不好',
    '不好',
    '不好',
    '不好',
    '不好',
    '不好',
    '不好',
  ];

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return initView();
  }

  initView(){
    return Scaffold(
      appBar: MyAppBar(
        title: '页面刷新',
      ),
      body: Container(
        height: BaseClass.screenH,
        color: BaseClass.kBackColor,
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: BaseClass.pullToRefreshStyle.header(),
          footer: BaseClass.pullToRefreshStyle.footer(),
          controller: _refreshController,
          onRefresh: () => _onListRefresh(context),
          onLoading: () => _onListLoadMore(context),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return inforMation(dataList[index], index);
            },
            itemCount: dataList.length,
            shrinkWrap: false,
          ),
        ),
      ),
    );
  }

  Widget inforMation(item, int index){
    return InkWell(

      child: Container(
        color: Colors.white,
        child: Text(
          item,
          style: TextStyle(
            fontSize: BaseClass.kFont(15),
            color: Colors.black,
          ),
        ),
      ),
    );
  }

}
