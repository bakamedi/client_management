extension DatetimeExt on DateTime {
  String get toHour {
    try {
      final String minuteTmp = minute == 0 ? '00' : minute.toString();
      return '$hour:${minuteTmp}hrs';
    } catch (_) {
      return '';
    }
  }

  String get toStartHourMinute {
    try {
      String period = hour >= 12 ? 'PM' : 'AM';
      return '$hour $period';
    } catch (_) {
      return '';
    }
  }

  String get toMaxHourMinute {
    try {
      final int hour = this.hour;
      final int minute = this.minute;
      final String period = hour >= 12 ? 'PM' : 'AM';

      if (minute == 0 || minute == 00) {
        return '$hour $period';
      } else {
        /// TODO: validacion de 24HORAS y 00HORAS
        final int newHour = hour + 1;
        return '$newHour $period';
      }
    } catch (_) {
      return '';
    }
  }
}
