extension IntExt on int {
  String get toHourPeriod {
    try {
      String period = this >= 12 ? 'PM' : 'AM';
      return '${toString()} $period';
    } catch (_) {
      return '';
    }
  }
}
