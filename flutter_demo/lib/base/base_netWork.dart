import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:package_info/package_info.dart';
import '../main.dart';
import 'base_class.dart';

class BaseNetWork {
  /*分页默认起始页*/
  static final int kStartIndex = 1;

  /*分页默认每一页数量*/
  static final int kPageSize = 10;

  /*请求成功*/
  static final int kCodeSuccess = 0;

  static requestWithUrl(
      String url,
      Map<String, Object> parameters,
      successBlock(int code, String message, Object data),
      errorBlock(error)) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    int? userId = SpUtil.userId!.getInt(BaseClass.kLocal_UserId);

    String? token = SpUtil.token!.getString(BaseClass.kLocal_Token);

    String? deveToken =
        SpUtil.userInfo!.getString(BaseClass.kLocal_DeviceToken);

    Map<String, dynamic> userInfo;

    String? info = SpUtil.userInfo!.getString(BaseClass.kLocal_UserInfo);

    Options options =
        Options(headers: {HttpHeaders.authorizationHeader: token});

    //公共参数
    var params = Map<String, Object>();
    //接口版本号
    params["apiVer"] = "1.0";
    //客户端类型（1:IOS 2:android）
    if (Platform.isIOS) {
      params["clientType"] = 1;
    } else {
      params["clientType"] = 2;
    }
    //客户端版本号
    params["clientVer"] = packageInfo.version;
    //DeviceToken
    params["deviceToken"] =
        (deveToken == null || deveToken == '') ? '0' : deveToken;
    //时间戳
    params["timestamp"] = new DateTime.now().millisecondsSinceEpoch.toString();
    //用户id
    params["userId"] = (userId == 0 || userId == null) ? 0 : userId;
    //0:普通用戶,1:专家用户，2：OA用户
    if ((info != null) && (info != '')) {
      userInfo = json.decode(info);
      params['source'] = (userInfo == null) ? 0 : userInfo['source'];
    } else {
      params['source'] = 0;
    }
//    //用户唯一token
//    params["token"] = token;
    //body
    params["body"] = parameters;

    var paramsF = Map<String, String>();

    paramsF['params'] = convert.jsonEncode(params).toString();
    try {
      Response response;
      Dio dio = new Dio();
      response =
          await dio.post(url, queryParameters: paramsF, options: options);
      print("请求地址：" + url);
      print("请求参数：" + paramsF.toString());
      print("返回参数：" + response.toString());

      Map map = json.decode(response.toString());
      int code = map["code"];
      String msg = map["msg"];
      Object data = map["data"];

      return successBlock(code, msg, data);
    } on DioError catch (error) {
      print("请求地址：" + url);
      print("请求参数：" + parameters.toString());
      print("请求报错：" + error.toString());

      return errorBlock(error);
    }
  }
}
