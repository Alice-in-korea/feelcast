import 'dart:convert';
import 'dart:developer';

import 'package:feelcast/core/core.dart';
import 'package:feelcast/model/dto/dto.dart';
import 'package:feelcast/repository/repository.dart';
import 'package:feelcast/support/util/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository repository;
  final LocalDBIsar localDB;

  WeatherCubit({required this.repository, required this.localDB})
    : super(WeatherInitial());

  Future<void> fetchWeatherInfos(int nx, int ny) async {
    emit(WeatherLoading());

    try {
      final List<List<Item>> datas = await Future.wait([
        _fetchWeather(nx, ny),
        _fetchUltraShortTermForecast(nx, ny),
      ]);

      emit(
        WeatherLoaded(
          currentWeather: datas.first,
          ultraShortThermForecast: datas.last,
        ),
      );
    } on RepositoryException catch (e) {
      emit(
        WeatherError(
          code: e.code,
          message: e.message ?? '실황 데이터를 가져오는 데 실패했습니다! $e',
        ),
      );
    }
  }

  Future<List<Item>> _fetchWeather(int nx, int ny) async {
    try {
      final WeatherResponseDto data = await repository.fetchCurrentWeatherData(
        baseDate: TimeUtil.getTodayDate(),
        baseTime: TimeUtil.getCurrentTime(),
        nx: nx,
        ny: ny,
      );

      if (data.response.body == null) {
        /// 로컬 DB에 저장된 날씨 정보가 없을 경우 빈 리스트 반환
        final weatherLocalData =
            await LocalDBIsar.instance.getCurrentWeatherLocalData();

        if (weatherLocalData.isNotEmpty) {
          final Map<String, dynamic> jsonMap = jsonDecode(
            weatherLocalData.first.jsonData,
          );

          final parsedWeatherLocalData =
              WeatherResponseDto.fromJson(jsonMap).response.body!.items.item;

          return parsedWeatherLocalData;
        }
        return [];
      }

      return data.response.body!.items.item;
    } on RepositoryException catch (e) {
      /// 로컬 DB에서 날씨 정보 가져오기
      /// 로컬 DB에 저장된 날씨 정보가 없을 경우 빈 리스트 반환
      final weatherLocalData =
          await LocalDBIsar.instance.getCurrentWeatherLocalData();

      if (weatherLocalData.isNotEmpty) {
        final Map<String, dynamic> jsonMap = jsonDecode(
          weatherLocalData.first.jsonData,
        );

        final parsedWeatherLocalData =
            WeatherResponseDto.fromJson(jsonMap).response.body!.items.item;

        emit(
          WeatherLoaded(
            currentWeather: parsedWeatherLocalData,
            ultraShortThermForecast:
                (state as WeatherLoaded).copyWith().ultraShortThermForecast,
          ),
        );

        return parsedWeatherLocalData;
      }

      emit(
        WeatherError(
          code: e.code,
          message: e.message ?? '기온 정보를 가져오는 데 실패했습니다. $e',
        ),
      );
      return [];
    }
  }

  Future<List<Item>> _fetchUltraShortTermForecast(int nx, int ny) async {
    int page = 1;
    bool hasSkyDataFound = false;
    List<Item> allSkyItems = [];

    try {
      //NOTE 초단기예보는 데이터양이 상대적으로 많아 페이지네이션으로 구현.
      //NOTE 필요로 하는 category인 'SKY'가 포함된 데이터가 나올 때까지 반복.
      while (!hasSkyDataFound) {
        final WeatherResponseDto data = await repository
            .fetchUltraShortTermForecastData(
              baseDate: TimeUtil.getTodayDate(),
              baseTime: TimeUtil.getCurrentTime(),
              nx: nx,
              ny: ny,
              pageNo: page,
            );

        if (data.response.body == null) {
          /// 로컬 DB에서 날씨 정보 가져오기
          /// 로컬 DB에 저장된 날씨 정보가 없을 경우 빈 리스트 반환
          final weatherLocalData =
              await LocalDBIsar.instance.getUltraShortTermForecastLocalData();

          if (weatherLocalData.isNotEmpty) {
            final Map<String, dynamic> jsonMap = jsonDecode(
              weatherLocalData.first.jsonData,
            );

            final parsedWeatherLocalData =
                WeatherResponseDto.fromJson(jsonMap).response.body!.items.item;

            return parsedWeatherLocalData;
          }
          return [];
        }

        final skyItems =
            data.response.body!.items.item
                .where((item) => item.category == "SKY")
                .toList();

        if (skyItems.isNotEmpty) {
          allSkyItems.addAll(skyItems);

          hasSkyDataFound = true;
        }

        page++;
      }
      return allSkyItems;
    } on RepositoryException catch (e) {
      /// 로컬 DB에서 날씨 정보 가져오기
      /// 로컬 DB에 저장된 날씨 정보가 없을 경우 빈 리스트 반환
      final weatherLocalData =
          await LocalDBIsar.instance.getUltraShortTermForecastLocalData();

      if (weatherLocalData.isNotEmpty) {
        final Map<String, dynamic> jsonMap = jsonDecode(
          weatherLocalData.first.jsonData,
        );

        final parsedWeatherLocalData =
            WeatherResponseDto.fromJson(jsonMap).response.body!.items.item;

        emit(
          WeatherLoaded(
            currentWeather: (state as WeatherLoaded).copyWith().currentWeather,
            ultraShortThermForecast: parsedWeatherLocalData,
          ),
        );

        return parsedWeatherLocalData;
      }

      emit(
        WeatherError(
          code: e.code,
          message: e.message ?? '하늘 정보를 가져오는 데 실패했습니다. $e',
        ),
      );
      return [];
    }
  }
}
