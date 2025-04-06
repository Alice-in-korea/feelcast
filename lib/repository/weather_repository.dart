import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:feelcast/core/config/config.dart';
import 'package:feelcast/core/error/error.dart';
import 'package:feelcast/model/model.dart';
import 'package:feelcast/repository/repository.dart';
import 'package:feelcast/support/constant/constant.dart';
import 'package:feelcast/support/enum/weather/weather.dart';
import 'package:feelcast/support/util/util.dart';

const numOfRows = 20;
const pageNo = 1;
const dataType = 'JSON';

class WeatherRepository extends BaseRepository {
  Future<WeatherResponseDto> fetchCurrentWeatherData({
    required String baseDate,
    required String baseTime,
    required int nx,
    required int ny,
  }) async {
    try {
      //NOTE 인코딩 이슈로 queryParameters 대신 완성된 URL 사용
      final response = await dioClient.client.get(
        '/${Endpoint.getCurrentWeather}?serviceKey=${Environment.publicApiKey}&base_date=$baseDate&base_time=$baseTime&nx=$nx&ny=$ny&numOfRows=$numOfRows&pageNo=$pageNo&dataType=$dataType',
      );

      if (response.statusCode == 200) {
        final weatherResponse = WeatherResponseDto.fromJson(response.data);

        final hasDataBody =
            response.data['response']['header']['resultCode'] ==
            successAndHasDataCode;

        /// 200 OK이면서 body가 null이 아닌 경우에만 로컬 DB에 저장
        if (hasDataBody) {
          /// 기존 데이터 삭제
          await LocalDBIsar.instance.deleteLocalDBByType(
            WeatherDataType.currentWeather.name,
          );

          final weatherJson =
              SavedWeatherData()
                ..type = WeatherDataType.currentWeather.name
                ..jsonData = jsonEncode(response.data);

          /// 로컬 데이터 업데이트
          await LocalDBIsar.instance.updateLocalWeatherData(weatherJson);
        }

        return weatherResponse;
      } else {
        //NOTE 99는 open api에 명시된 기타에러
        final errorCode = response.data['resultCode'] ?? apiErrorUnknownCode;
        final apiErrorCode = getApiErrorCode(errorCode);

        throw RepositoryException(
          code: apiErrorCode,
          message: 'API 호출 실패: 상태 코드 ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw RepositoryException(
        code: ApiErrorCode.httpError,
        message: e.message,
      );
    } catch (e) {
      throw RepositoryException(
        code: ApiErrorCode.unknownError,
        message: 'fetchCurrentWeatherData 호출 중 오류 발생: $e',
      );
    }
  }

  Future<WeatherResponseDto> fetchUltraShortTermForecastData({
    required String baseDate,
    required String baseTime,
    required int nx,
    required int ny,
    required int pageNo,
  }) async {
    try {
      //NOTE 인코딩 이슈로 queryParameters 대신 완성된 URL 사용
      final response = await dioClient.client.get(
        '/${Endpoint.getUltraShortTermForecast}?serviceKey=${Environment.publicApiKey}&base_date=$baseDate&base_time=$baseTime&nx=$nx&ny=$ny&numOfRows=$numOfRows&pageNo=$pageNo&dataType=$dataType',
      );

      if (response.statusCode == 200) {
        final weatherResponse = WeatherResponseDto.fromJson(response.data);

        final hasDataBody =
            response.data['response']['header']['resultCode'] ==
            successAndHasDataCode;

        /// 200 OK이면서 body가 null이 아닌 경우에만 로컬 DB에 저장
        if (hasDataBody) {
          /// 기존 데이터 삭제
          await LocalDBIsar.instance.deleteLocalDBByType(
            WeatherDataType.ultraShortTermForecast.name,
          );

          final weatherJson =
              SavedWeatherData()
                ..type = WeatherDataType.ultraShortTermForecast.name
                ..jsonData = jsonEncode(response.data);

          /// 로컬 데이터 업데이트
          await LocalDBIsar.instance.updateLocalWeatherData(weatherJson);
        }

        return weatherResponse;
      } else {
        final errorCode = response.data['resultCode'] ?? apiErrorUnknownCode;
        final apiErrorCode = getApiErrorCode(errorCode);

        throw RepositoryException(
          code: apiErrorCode,
          message: 'API 호출 실패: 상태 코드 ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw RepositoryException(
        code: ApiErrorCode.httpError,
        message: e.message,
      );
    } catch (e) {
      throw RepositoryException(
        code: ApiErrorCode.unknownError,
        message: 'fetchUltraShortTermForecastData 호출 중 오류 발생: $e',
      );
    }
  }
}
