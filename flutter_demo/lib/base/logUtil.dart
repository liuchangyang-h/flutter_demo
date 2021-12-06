import 'package:flutter/foundation.dart';

///打印log
void log(Object? object, {String? tag}) {
  var tag = DateTime.now();
  bool _debugMode = kDebugMode;
  int _maxLen = 128;
  if (_debugMode) {
    String da = object?.toString() ?? 'null';
    if (da.length <= _maxLen) {
      print('$tag $da');
      return;
    }
    print(
        '$tag — — — — — — — — — — — — — — — — st — — — — — — — — — — — — — — — —');

    print('$tag $da');
    print(
        '$tag — — — — — — — — — — — — — — — — ed — — — — — — — — — — — — — — — —');
  }
}
