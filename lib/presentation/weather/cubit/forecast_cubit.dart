import 'dart:convert';

import 'package:feelcast/core/core.dart';
import 'package:feelcast/model/dto/dto.dart';
import 'package:feelcast/repository/repository.dart';
import 'package:feelcast/support/enum/enum.dart';
import 'package:feelcast/support/util/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final WeatherRepository repository;
  final LocalDBIsar localDB;

  ForecastCubit({required this.repository, required this.localDB})
    : super(ForecastInitial());

  Future<void> fetchUltraShortTermForecast(int nx, int ny) async {
    int page = 1;
    bool hasSkyDataFound = false;

    emit(ForecastLoading());

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

            emit(
              ForecastLoaded(ultraShortThermForecast: parsedWeatherLocalData),
            );
            return;
          } else {
            emit(
              ForecastError(
                code: ApiErrorCode.unknownError,
                message: '200ok 이지만 하늘 정보를 가져오는 데 실패했습니다.',
              ),
            );
          }
        } else {
          final skyItems =
              data.response.body!.items.item
                  .where((item) => item.category == "SKY")
                  .toList();

          if (skyItems.isNotEmpty) {
            hasSkyDataFound = true;

            emit(ForecastLoaded(ultraShortThermForecast: skyItems));
            return;
          }

          page++;
        }
      }
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

        emit(ForecastLoaded(ultraShortThermForecast: parsedWeatherLocalData));
      }

      emit(
        ForecastError(
          code: e.code,
          message: e.message ?? '하늘 정보를 가져오는 데 실패했습니다. $e',
        ),
      );
    }
  }

  Future<void> fetchLocalUltraShortTermForecast() async {
    emit(ForecastLoading());

    try {
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

        emit(ForecastLoaded(ultraShortThermForecast: parsedWeatherLocalData));
        return;
      } else {
        emit(
          ForecastError(
            code: ApiErrorCode.unknownError,
            message: '저장된 데이터가 없습니다.',
          ),
        );
      }
    } catch (e) {
      emit(
        ForecastError(
          code: ApiErrorCode.unknownError,
          message: '하늘 정보를 가져오는 데 실패했습니다.',
        ),
      );
    }
  }
}
