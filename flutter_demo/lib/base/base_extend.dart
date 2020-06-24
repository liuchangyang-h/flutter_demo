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
}
