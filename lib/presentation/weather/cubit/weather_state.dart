part of 'weather_cubit.dart';

sealed class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<Item> currentWeather;

  WeatherLoaded({required this.currentWeather});

  Item? get currentTempData => findTempValue(currentWeather);

  WeatherLoaded copyWith({List<Item>? currentWeather}) {
    return WeatherLoaded(currentWeather: currentWeather ?? this.currentWeather);
  }
}

class WeatherError extends WeatherState {
  final ApiErrorCode code;
  final String message;

  WeatherError({required this.code, required this.message});
}

Item? findTempValue(List<Item> items) {
  try {
    return items.firstWhere((e) => e.category == 'T1H');
  } catch (e) {
    return null;
  }
}
