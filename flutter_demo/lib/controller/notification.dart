///订阅者回调签名
typedef void NotificationCallback(object);

class NotificationBus {
  ///私有构造函数
  NotificationBus._internal();

  ///保存单例
  static NotificationBus _singleton = new NotificationBus._internal();

  ///工厂构造函数
  factory NotificationBus() => _singleton;

  ///保存事件订阅者队列，key:事件名(id)，value: 对应事件的订阅者队列
  var _emap = new Map<Object, List<NotificationCallback>>();

  ///添加订阅者
  void add(eventName, NotificationCallback f) {
    if (eventName == null || f == null) return;
    _emap[eventName] ??= new List<NotificationCallback>();
    _emap[eventName].add(f);
  }

  ///移除订阅者
  void delete(eventName, [NotificationCallback f]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  ///触发事件，事件触发后该事件所有订阅者会被调用
  void trigger(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    ///反向遍历，防止订阅者在回调中移除自身带来的下标错位
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }
}

  ///定义一个top-level（全局）变量，页面引入该文件后可以直接使用bus
  var notice = new NotificationBus();

/**
 * 使用示例
 *
 *添加（name表示标签名，object表示是回调内容）
 *notice.add('name', (object){});
 *
 * 触发（name表示标签名，object表示是触发内容）
 * notice.trigger('name','bject');
 *
 * 移除（name表示标签名）
 * notice.delete('name');

 * */
