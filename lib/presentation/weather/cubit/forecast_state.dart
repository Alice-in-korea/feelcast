part of 'forecast_cubit.dart';

sealed class ForecastState {}

class ForecastInitial extends ForecastState {}

class ForecastLoading extends ForecastState {}

class ForecastLoaded extends ForecastState {
  final List<Item> ultraShortThermForecast;

  ForecastLoaded({required this.ultraShortThermForecast});

  Item? get currentSkyData => findSkyValue(ultraShortThermForecast);

  ForecastLoaded copyWith({List<Item>? ultraShortThermForecast}) {
    return ForecastLoaded(
      ultraShortThermForecast:
          ultraShortThermForecast ?? this.ultraShortThermForecast,
    );
  }
}

class ForecastError extends ForecastState {
  final ApiErrorCode code;
  final String message;

  ForecastError({required this.code, required this.message});
}

Item? findSkyValue(List<Item> items) {
  try {
    return items.firstWhere((e) => e.category == 'SKY');
  } catch (e) {
    return null;
  }
}
