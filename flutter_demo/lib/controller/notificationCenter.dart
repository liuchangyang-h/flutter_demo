typedef NotificationUsingBlock = Function(dynamic object);

///页面通知传值
class NotificationManage {
  factory NotificationManage() => _getInstance();

  static NotificationManage get instance => _getInstance();

  static NotificationManage? _instance;

  NotificationManage._internal();

  static NotificationManage _getInstance() {
    if (_instance == null) _instance = new NotificationManage._internal();
    return _instance!;
  }

  /// 存储所有的通知信息
  Map<String, dynamic> _notificationInfo = Map<String, dynamic>();

  /// 存储所有的通知回调
  Map<String, NotificationUsingBlock> _notificationBlock =
      Map<String, NotificationUsingBlock>();

  /// 添加通知
  /// name：通知名称
  /// using：通知内容回调
  addNotification(String name, NotificationUsingBlock usingBlock) {
    _notificationInfo[name] = null;
    _notificationBlock[name] = usingBlock;
  }

  /// 发送通知
  /// name：通知名称
  /// object：通知内容
  postNotification(String name, dynamic object) {
    if (_notificationInfo.containsKey(name)) {
      _notificationInfo[name] = object;
      NotificationUsingBlock? block = _notificationBlock[name];
      if (block != null) block(object);
    }
  }

  /// 删除指定通知
  /// name：通知名称
  removeNotification(String name) {
    if (_notificationInfo.containsKey(name)) _notificationInfo.remove(name);
    if (_notificationBlock.containsKey(name)) _notificationBlock.remove(name);
  }

  /// 删除所有通知
  removeAllNotification() {
    _notificationInfo.clear();
    _notificationBlock.clear();
  }
}
