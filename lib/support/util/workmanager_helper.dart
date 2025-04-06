import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:feelcast/core/core.dart';
import 'package:feelcast/model/local_db/local_db.dart';
import 'package:feelcast/repository/weather_repository.dart';
import 'package:feelcast/support/constant/constant.dart';
import 'package:feelcast/support/enum/enum.dart';
import 'package:feelcast/support/util/util.dart';
import 'package:workmanager/workmanager.dart';

const weatherPeriodicTask = "periodic-task";
const weatherTask = "simple-task";

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    /// workmanager for isolate
    await LocalDBIsar.instance.initLocalDB();

    switch (task) {
      case weatherPeriodicTask:
        final nx = inputData?['x'];
        final ny = inputData?['y'];

        try {
          LogHelper.logInfo(
            '${TimeUtil.getCurrentTime()} weatherPeriodicTask start - nx:$nx, ny:$ny',
          );

          final responseList = await Future.wait([
            DioClient().client.get(
              '/${Endpoint.getCurrentWeather}?serviceKey=${Environment.publicApiKey}&base_date=${TimeUtil.getTodayDate()}&base_time=${TimeUtil.getCurrentTime()}&nx=$nx&ny=$ny&numOfRows=$numOfRows&pageNo=$pageNo&dataType=$dataType',
            ),
            DioClient().client.get(
              '/${Endpoint.getUltraShortTermForecast}?serviceKey=${Environment.publicApiKey}&base_date=${TimeUtil.getCurrentTime()}&base_time=${TimeUtil.getCurrentTime()}&nx=$nx&ny=$ny&numOfRows=$numOfRows&pageNo=$pageNo&dataType=$dataType',
            ),
          ]);

          if (responseList.first.statusCode == 200) {
            final hasCurrentWeatherDataBody =
                responseList.first.data['response']['header']['resultCode'] ==
                successAndHasDataCode;

            /// 200 OK이면서 body가 null이 아닌 경우에만 로컬 DB에 저장
            if (!hasCurrentWeatherDataBody) break;

            /// 기존 로컬 데이터 삭제
            await LocalDBIsar.instance.deleteLocalDBByType(
              WeatherDataType.currentWeather.name,
            );

            final weatherJson =
                SavedWeatherData()
                  ..type = WeatherDataType.currentWeather.name
                  ..jsonData = jsonEncode(responseList.first.data);

            /// 로컬 데이터 업데이트
            await LocalDBIsar.instance.updateLocalWeatherData(weatherJson);
          } else {
            final errorCode =
                responseList.first.data['resultCode'] ?? apiErrorUnknownCode;
            final apiErrorCode = getApiErrorCode(errorCode);

            throw RepositoryException(
              code: apiErrorCode,
              message: 'API 호출 실패: 상태 코드 ${responseList.first.statusCode}',
            );
          }

          if (responseList.last.statusCode == 200) {
            final hasUltraShortTermForecastDataBody =
                responseList.last.data['response']['header']['resultCode'] ==
                successAndHasDataCode;

            /// 200 OK이면서 body가 null이 아닌 경우에만 로컬 DB에 저장
            if (!hasUltraShortTermForecastDataBody) break;

            /// 기존 로컬 데이터 삭제
            await LocalDBIsar.instance.deleteLocalDBByType(
              WeatherDataType.ultraShortTermForecast.name,
            );

            final weatherJson =
                SavedWeatherData()
                  ..type = WeatherDataType.ultraShortTermForecast.name
                  ..jsonData = jsonEncode(responseList.last.data);

            /// 로컬 데이터 업데이트
            await LocalDBIsar.instance.updateLocalWeatherData(weatherJson);
          } else {
            final errorCode =
                responseList.last.data['resultCode'] ?? apiErrorUnknownCode;
            final apiErrorCode = getApiErrorCode(errorCode);

            throw RepositoryException(
              code: apiErrorCode,
              message: 'API 호출 실패: 상태 코드 ${responseList.last.statusCode}',
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

        break;
    }
    bool success = true;
    return Future.value(success);
  });
}
