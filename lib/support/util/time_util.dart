class TimeUtil {
  TimeUtil._();

  static String getCurrentTime() {
    final now = DateTime.now();
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');
    return '$hour$minute';
  }

  static String getTime1HoursAgo() {
    final past = DateTime.now().subtract(Duration(hours: 1));
    final hour = past.hour.toString().padLeft(2, '0');
    final minute = past.minute.toString().padLeft(2, '0');
    return '$hour$minute';
  }

  static String getTodayDate() {
    final now = DateTime.now();
    final year = now.year.toString();
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');
    return '$year$month$day';
  }

  static String formatStringToTime(String time) {
    final timeStr = time.toString().padLeft(4, '0');
    final hour = timeStr.substring(0, 2);
    final minute = timeStr.substring(2, 4);
    return '$hour:$minute';
  }
}
