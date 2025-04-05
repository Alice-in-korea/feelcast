import 'package:feelcast/model/dto/dto.dart';
import 'package:feelcast/support/enum/weather/weather.dart';

sealed class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<Item> currentWeather;
  final List<Item> ultraShortThermForecast;

  WeatherLoaded({
    required this.currentWeather,
    required this.ultraShortThermForecast,
  });

  Item? get currentTempData => findValue(currentWeather, 'T1H');
  Item? get currentSkyData => findValue(ultraShortThermForecast, 'SKY');

  WeatherLoaded copyWith({
    List<Item>? currentWeather,
    List<Item>? ultraShortThermForecast,
  }) {
    return WeatherLoaded(
      currentWeather: currentWeather ?? this.currentWeather,
      ultraShortThermForecast:
          ultraShortThermForecast ?? this.ultraShortThermForecast,
    );
  }
}

class WeatherError extends WeatherState {
  final ApiErrorCode code;
  final String message;

  WeatherError({required this.code, required this.message});
}

Item? findValue(List<Item> items, String category) {
  try {
    return items.firstWhere((e) => e.category == category);
  } catch (e) {
    return null;
  }
}
