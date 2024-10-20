extension BoolExt on bool? {
  bool get isNull {
    try {
      return this == null;
    } catch (_) {
      return false;
    }
  }
}
