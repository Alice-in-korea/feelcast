import 'package:isar/isar.dart';

part 'saved_weather_data.g.dart';

@collection
class SavedWeatherData {
  Id id = Isar.autoIncrement;

  /// 'current_weather','ultra_short_term_forecast'
  late String type;

  /// JSON string으로 저장
  late String jsonData;
}
