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

  //正式
//  static const String kHttp_HostName = "http://101.37.152.202:8081/api";

  //APP配置页面
  static const String kUrl_Common_App_Page =
      kHttp_HostName + '/common/app/page';

  //获取天气（阿里云天气）
  static const String kUrl_Common_Weather = kHttp_HostName + '/common/weather';

  //获取版本信息
  static const String kUrl_Common_App_Version =
      kHttp_HostName + '/common/app/version';

  //获取OSS上传签名信息
  static const String kur_Token_AliOssToken =
      kHttp_HostName + '/token/aliOssToken';

  //发送验证码
  static const String kUrl_Common_App_SmsCode =
      kHttp_HostName + '/common/app/smsCode';

  //用户反馈
  static const String kUrl_Common_App_Feedback =
      kHttp_HostName + '/common/app/feedback';

  //重置密码
  static const String kUrl_Account_ResetPassword =
      kHttp_HostName + '/account/resetPassword';

  //省市区—获取省份列表
  static const String kUrl_Common_Province_List =
      kHttp_HostName + '/common/province/list';

  //省市区—获取市区列表
  static const String kUrl_Common_City_List =
      kHttp_HostName + '/common/city/list';

  //省市区—获取地区列表
  static const String kUrl_Common_Area_List =
      kHttp_HostName + '/common/area/list';

  //系统消息—消息列表
  static const String kUrl_Common_Message_List =
      kHttp_HostName + '/common/message/list';

  //系统消息—获取系统未读消息数
  static const String kUrl_Common_Message_UnreadCount =
      kHttp_HostName + '/common/message/unreadCount';

  //系统消息—更新消息状态
  static const String kUrl_Common_Message_UpdateState =
      kHttp_HostName + '/common/message/updateState';

  //系统消息—删除消息
  static const String kUrl_Common_Message_Delete =
      kHttp_HostName + '/common/message/delete';

  //登录
  static const String kUrl_Account_Login = kHttp_HostName + '/account/login';

  //获取用户信息
  static const String kUrl_User_GetInfo = kHttp_HostName + '/user/getInfo';

  //修改用户信息
  static const String kUrl_Usrt_Modify = kHttp_HostName + '/user/modify';

  //获取轮播图
  static const String kUrl_Ad_List = kHttp_HostName + '/ad/list';

  //轮播图点击验证
  static const String kUrl_Ad_ClickVerify = kHttp_HostName + '/ad/clickVerify';

  //根据分类获取视频列表
  static const String kUr_Video_List = kHttp_HostName + '/video/list';

  //九宫格菜单
  static const String kUrl_Menu_List = kHttp_HostName + '/menu/list';

  //九宫格子模块
  static const String kUrl_Menu_Submenu = kHttp_HostName + '/menu/submenu';

  //视频分类列表
  static const String kUrl_Video_Type_List =
      kHttp_HostName + '/video/type/list';

  //根据分类获取视频列表
  static const String kUrl_Video_List = kHttp_HostName + '/video/list';

  //更新视频播放次数
  static const String kUrl_Video_Play_Count_Update =
      kHttp_HostName + '/video/playCount/update';

  //视频详情
  static const String kUrl_Video_Detail = kHttp_HostName + '/video/detail';

  //获取资讯列表
  static const String kUrl_Article_List = kHttp_HostName + '/article/list';

  //获取文章详情
  static const String kUrl_Article_Detail = kHttp_HostName + '/article/detail';

  //资讯列表
  static const String kUrl_News_List = kHttp_HostName + '/article/list';

  //资讯详情
  static const String kUrl_News_Detail = kHttp_HostName + '/article/detail';

  //收藏接口
  static const String kUrl_Collection_Cancel =
      kHttp_HostName + '/collection/change';

  //收藏列表
  static const String kUrl_Collection_List =
      kHttp_HostName + '/collection/list';

  //我的提问
  static const String kUrl_Owner_Question_List =
      kHttp_HostName + '/home/owner/questionList';

  //我的回答
  static const String kUrl_Owner_Comment_List =
      kHttp_HostName + '/home/owner/commentList';

  //我的交流
  static const String kUrl_Owner_Communication_List =
      kHttp_HostName + '/home/owner/communicationList';

  //我的关注
  static const String kUrl_Owner_Attention_List =
      kHttp_HostName + '/home/owner/attentionList';

  //我的供求
  static const String kUrl_Owner_Trade_List =
      kHttp_HostName + '/home/owner/tradeList';

  //我的供求
  static const String kUrl_Owner_onlyQuestion_List =
      kHttp_HostName + '/home/owner/onlyQuestionList';

  //获取专家分类
  static const String kUrl_Expert_Type_List =
      kHttp_HostName + '/expert/type/list';

  //获取专家列表
  static const String kUrl_Expert_List = kHttp_HostName + '/expert/list';

  //获取专家信息
  static const String kUrl_Expert_Info = kHttp_HostName + '/expert/info';

  //一对一提问：咨询专家
  static const String kUrl_Expert_Consult = kHttp_HostName + '/expert/consult';

  //获取专家答疑列表
  static const String kUrl_OnlyQuestion_List =
      kHttp_HostName + '/expert/onlyQuestion/list';

  //一对一提问：问答详情
  static const String kUrl_OnlyQuestion_Detail =
      kHttp_HostName + '/expert/onlyQuestion/detail';

  //一对一提问：删除问答
  static const String kUrl_OnlyQuestion_Delete =
      kHttp_HostName + '/expert/onlyQuestion/delete';

  //评论列表
  static const String kUrl_Comment_List = kHttp_HostName + '/comment/list';

  //新增评论
  static const String kUrl_Comment_Add = kHttp_HostName + '/comment/add';

  //删除评论
  static const String kUrl_Comment_Delete = kHttp_HostName + '/comment/delete';

  //关注/取消关注
  static const String kUrl_Attention_Change =
      kHttp_HostName + '/attention/change';

  //点赞/取消点赞
  static const String kUrl_Vote_Change = kHttp_HostName + '/vote/change';

  //删除交流
  static const String kUrl_Communication_Delete =
      kHttp_HostName + '/communication/delete';

  //快速提问列表
  static const String kUrl_Question_List =
      kHttp_HostName + '/quickQuestion/list';

  //快速提问详情
  static const String kUrl_Question_Deatil =
      kHttp_HostName + '/quickQuestion/detail';

  //交流列表
  static const String kUrl_Communication_List =
      kHttp_HostName + '/communication/list';

  //交流详情
  static const String kUrl_Communication_Detail =
      kHttp_HostName + '/communication/detail';

  //发布快速提问
  static const String kUrl_Publish_Question =
      kHttp_HostName + '/quickQuestion/publish';

  //删除快速提问
  static const String kUrl_Delete_Question =
      kHttp_HostName + '/quickQuestion/delete';

  //发布交流
  static const String kUrl_Publish_Communication =
      kHttp_HostName + '/communication/publish';

  //发布评论
  static const String kUrl_Publish_Comment = kHttp_HostName + '/comment/add';

  //举报帖子
  static const String kUrl_Publish_Report =
      kHttp_HostName + '/common/app/report';

  //农资精选列表
  static const String kUrl_Selection_List =
      kHttp_HostName + '/brand/agriculturalSelection/list';

  //企业推荐列表
  static const String kUrl_Recommendation_List =
      kHttp_HostName + '/brand/enterpriseRecommendation/list';

  //农资精选、企业推荐详情
  static const String kUrl_Btand_Detail = kHttp_HostName + '/brand/detail';

  //企业推荐详情里的农资推荐
  static const String kUrl_AgriculturalRecommendation_List =
      kHttp_HostName + '/brand/agriculturalRecommendation/list';

  //发布日志
  static const String kUrl_Publish_Note = kHttp_HostName + '/eventLog/publish';

  //日志列表
  static const String kUrl_Note_List = kHttp_HostName + '/eventLog/list';

  //获取count
  static const String kUrl_Note_DayCount =
      kHttp_HostName + '/eventLog/dayCount';

  //供求分类—父级列表
  static const String kUrl_Type_ParentList =
      kHttp_HostName + '/trade/type/parentList';

  //供求分类—子级列表
  static const String kUrl_Type_ChildList =
      kHttp_HostName + '/trade/type/childList';

  //供求列表
  static const String kUrl_Trade_List = kHttp_HostName + '/trade/list';

  //供求详情
  static const String kUrl_Trade_Detail = kHttp_HostName + '/trade/detail';

  //发布供求
  static const String kUrl_Trade_Publish = kHttp_HostName + '/trade/publish';

  //删除供求
  static const String kUrl_Trade_Delete = kHttp_HostName + '/trade/delete';

  //修改供求状态
  static const String kUrl_Trade_Update = kHttp_HostName + '/trade/update';

  //获取植保分类Type
  static const String kUrl_Knowledge_PlantType_List =
      kHttp_HostName + '/knowledge/plantType/list';

  //获取植保列表
  static const String kUrl_Knowledge_Plant_List =
      kHttp_HostName + '/knowledge/plant/list';

  //获取植保详情
  static const String kUrl_Knowledge_Plant_detail =
      kHttp_HostName + '/knowledge/plant/detail';

  //品种库分类列表
  static const String kUrl_SeedType_List =
      kHttp_HostName + '/knowledge/seedType/list';

  //品种库列表
  static const String kUrl_Seed_List = kHttp_HostName + '/knowledge/seed/list';

  //品种库详情
  static const String kUrl_Seed_Detail =
      kHttp_HostName + '/knowledge/seed/detail';

  //法规库列表
  static const String kUrl_Ordinance_List =
      kHttp_HostName + '/knowledge/ordinance/list';

  //法规库详情
  static const String kUrl_Ordinance_Detail =
      kHttp_HostName + '/knowledge/ordinance/detail';

  //获取搜索热词
  static const String kUrl_Home_HotWords = kHttp_HostName + '/home/hotWords';

  //搜索
  static const String kUrl_Home_Search = kHttp_HostName + '/home/search';

  ///获取农技耘专家列表
  static const String kUrl_common_getTypes =
      kHttp_NJYHostName + '/common/getTypes.action';

  ///向农技耘专家提问
  static const String kUrl_yanhai_publish =
      kHttp_NJYHostName + '/yanhai/publish.action';

  ///沿海用户回答
  static const String kUrl_yanhai_answer =
      kHttp_NJYHostName + '/yanhai/answer.action';

  ///沿海我的提问
  static const String kUrl_yanhai_askQuestion =
      kHttp_NJYHostName + '/yanhai/askQuestions.action';

  ///沿海问题详情
  static const String kUrl_yanhai_questionDetail =
      kHttp_NJYHostName + '/yanhai/getQuestionDetail.action';

  ///沿海回复列表
  static const String kUrl_yanhai_Comments =
      kHttp_NJYHostName + '/yanhai/getComments.action';
}