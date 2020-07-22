import 'package:flutter/material.dart';
import 'package:flutterdemo/base/base_class.dart';
import 'package:flutterdemo/controller/bg_container.dart';
import 'package:flutterdemo/controller/navigation.dart';
import 'package:flutterdemo/controller/tableView_cell.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshPage extends StatefulWidget {
  @override
  _RefreshPageState createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  ///自定义int
  int page = 0;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  //下拉刷新的方法
  Future<Null> _onListRefresh(BuildContext context) async {
    _refreshController.refreshCompleted();
    page = 0;
    setState(() {
      dataList = [
        {
          'title': '输入框',
        },
        {
          'title': '图片上传',
        },
        {
          'title': '弹出提示框',
        },
        {
          'title': '拉下刷新',
        },
        {
          'title': '你好',
        },
        {
          'title': '不好',
        },
      ];
    });
  }

  //分页加载更多的方法
  Future<Null> _onListLoadMore(BuildContext context) async {
    _refreshController.loadComplete();

    page++;
    var params = Map<String, Object>();
    //接口版本号
    params["title"] = '累计数${page}';
    setState(() {
      dataList.add(params);
    });
  }

  ///初始化数组
  List dataList = [
    {
      'title': '输入框',
    },
    {
      'title': '图片上传',
    },
    {
      'title': '弹出提示框',
    },
    {
      'title': '拉下刷新',
    },
    {
      'title': '你好',
    },
    {
      'title': '不好',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '页面刷新',
      ),
      body: BGContainer(
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
              return TableViewCell(
                item: this.dataList[index],
                isClick: false,
              );
            },
            itemCount: dataList.length,
          ),
        ),
      ),
    );
  }

  Widget inforMation(item, int index) {
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
