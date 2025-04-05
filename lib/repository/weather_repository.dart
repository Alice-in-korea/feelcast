import 'package:dio/dio.dart';
import 'package:feelcast/core/config/config.dart';
import 'package:feelcast/core/error/error.dart';
import 'package:feelcast/model/dto/dto.dart';
import 'package:feelcast/repository/repository.dart';
import 'package:feelcast/support/constant/constant.dart';
import 'package:feelcast/support/enum/weather/weather.dart';

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

        return weatherResponse;
      } else {
        //NOTE 99는 open api에 명시된 기타에러
        final errorCode = response.data['resultCode'] ?? '99';
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

        return weatherResponse;
      } else {
        final errorCode = response.data['resultCode'] ?? '99';
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
