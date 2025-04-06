enum WeatherDataType {
  currentWeather('current_weather'),
  ultraShortTermForecast('ultra_short_term_forecast');

  final String name;

  const WeatherDataType(this.name);
}
