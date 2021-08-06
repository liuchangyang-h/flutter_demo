class BaseExtend {
  /*
      验证List、Map、String是否有值

      @return （true：有值 false：空）
   */
  static isValue(Object value) {
    if (value == null) return false;
    if (value is String && value.length != 0 && value.isNotEmpty) {
      return true;
    } else if (value is List && value.isNotEmpty && value.length > 0) {
      return true;
    } else if (value is Map && value.isNotEmpty) {
      return true;
    }
    return false;
  }

  ///List转String用逗号分隔
  static String getStringFromString(List object) {
    if (BaseExtend.isValue(object)) {
      List tempList = List();
      String str = '';
      object.forEach((f) {
        tempList.add(f);
      });

      tempList.forEach((f) {
        if (str == '') {
          str = "$f";
        } else {
          str = "$str" "," "$f";
        }
      });

      return str;
    }
    return '';
  }

  ///String用逗号分隔转List
  static List getStringFromList(String object) {
    List list = new List();
    if (BaseExtend.isValue(object)) {
      list = object.split(',');
      return list;
    }
    return list;
  }
}
