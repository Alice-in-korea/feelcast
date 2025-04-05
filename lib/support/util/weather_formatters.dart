class WeatherFormatters {
  WeatherFormatters._();

  static String formatTemperature(String? raw) {
    final value = double.tryParse(raw ?? '');
    return value == null ? '기온 정보 없음' : '${value.toStringAsFixed(1)}℃';
  }

  static String formatWindSpeed(String? raw) {
    final value = double.tryParse(raw ?? '');
    return value == null ? '풍속 정보 없음' : '${value.toStringAsFixed(1)}m/s';
  }

  static String formatHumidity(String? raw) {
    final value = int.tryParse(raw ?? '');
    return value == null ? '습도 정보 없음' : '$value%';
  }

  static String formatPrecipitationAmount(String? raw) {
    if (raw == null || raw == '-' || raw == '0') return '강수없음';
    final value = double.tryParse(raw);
    if (value == null) return '강수없음';
    if (value < 1.0) return '1mm 미만';
    if (value < 30.0) return '${value.toStringAsFixed(1)}mm';
    if (value < 50.0) return '30.0~50.0mm';
    return '50.0mm 이상';
  }
}
