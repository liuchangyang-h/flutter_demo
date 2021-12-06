class NetUrl {
  //本地地址
//  static const String kHttp_HostName = 'http://192.168.50.241:8029/yanhai-api';

  //本地穿透
//  static const String kHttp_HostName =
//      "http://nongye-api.utools.club/yanhai-api";

  //测试
//  static const String kHttp_HostName = "http://47.96.98.193/yanhai-api";

  ///测试
  static const String kHttp_HostName = "https://yanhai.njbandou.com/yanhai-api";

  ///农技耘前缀
  ///本地
//  static const String kHttp_NJYHostName = "http://192.168.50.40:8085";

  ///测试
  static const String kHttp_NJYHostName = "http://47.96.169.148:8090/web";

  ///正式
//  static const String kHttp_NJYHostName = "https://njy.jsnjy.net.cn/web";

  ///正式
//  static const String kHttp_HostName = "http://101.37.152.202:8081/api";

  ///获取OSS上传签名信息
  static const String kur_Token_AliOssToken =
      kHttp_HostName + '/token/aliOssToken';
}
