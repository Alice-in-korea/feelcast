import 'dart:convert';

import 'package:feelcast/core/core.dart';
import 'package:feelcast/model/dto/dto.dart';
import 'package:feelcast/repository/repository.dart';
import 'package:feelcast/support/enum/enum.dart';
import 'package:feelcast/support/util/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository repository;
  final LocalDBIsar localDB;

  WeatherCubit({required this.repository, required this.localDB})
    : super(WeatherInitial());

  Future<void> fetchWeather(int nx, int ny) async {
    emit(WeatherLoading());

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

          final parsedLocalData =
              WeatherResponseDto.fromJson(jsonMap).response.body!.items.item;
          emit(WeatherLoaded(currentWeather: parsedLocalData));
        } else {
          emit(
            WeatherError(
              code: ApiErrorCode.unknownError,
              message: '200ok 이지만 기온 정보를 가져오는 데 실패했습니다.',
            ),
          );
        }
      } else {
        emit(WeatherLoaded(currentWeather: data.response.body!.items.item));
      }
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

        emit(WeatherLoaded(currentWeather: parsedWeatherLocalData));
      } else {
        emit(
          WeatherError(
            code: e.code,
            message: e.message ?? '기온 정보를 가져오는 데 실패했습니다. $e',
          ),
        );
      }
    }
  }

  Future<void> fetchLocalWeather() async {
    emit(WeatherLoading());

    try {
      /// 로컬 DB에 저장된 날씨 정보가 없을 경우 빈 리스트 반환
      final weatherLocalData =
          await LocalDBIsar.instance.getCurrentWeatherLocalData();

      if (weatherLocalData.isNotEmpty) {
        final Map<String, dynamic> jsonMap = jsonDecode(
          weatherLocalData.first.jsonData,
        );

        final parsedLocalData =
            WeatherResponseDto.fromJson(jsonMap).response.body!.items.item;
        emit(WeatherLoaded(currentWeather: parsedLocalData));
      } else {
        emit(
          WeatherError(
            code: ApiErrorCode.unknownError,
            message: '저장된 데이터가 없습니다.',
          ),
        );
      }
    } catch (e) {
      emit(
        WeatherError(
          code: ApiErrorCode.unknownError,
          message: '기온 정보를 가져오는 데 실패했습니다.',
        ),
      );
    }
  }
}
