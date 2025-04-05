import 'package:dio/dio.dart';
import 'package:feelcast/core/core.dart';
import 'package:feelcast/model/dto/dto.dart';
import 'package:feelcast/repository/weather_repository.dart';
import 'package:feelcast/support/constant/constant.dart';
import 'package:feelcast/support/enum/enum.dart';
import 'package:feelcast/support/util/util.dart';
import 'package:workmanager/workmanager.dart';

const weatherPeriodicTask = "periodic-task";

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case weatherPeriodicTask:
        final nx = inputData?['x'];
        final ny = inputData?['y'];

        LogHelper.logInfo('$nx - $ny');
        try {
          final response = await Dio().get(
            '${Environment.publicApiBaseUrl}/${Endpoint.getCurrentWeather}?serviceKey=${Environment.publicApiKey}&base_date=${TimeUtil.getTodayDate()}&base_time=${TimeUtil.getCurrentTime()}&nx=$nx&ny=$ny&numOfRows=$numOfRows&pageNo=$pageNo&dataType=$dataType',
          );

          LogHelper.logInfo(
            '${Environment.publicApiBaseUrl}/${Endpoint.getCurrentWeather}?serviceKey=${Environment.publicApiKey}&base_date=${TimeUtil.getTodayDate()}&base_time=${TimeUtil.getCurrentTime()}&nx=$nx&ny=$ny&numOfRows=$numOfRows&pageNo=$pageNo&dataType=$dataType',
          );

          if (response.statusCode == 200) {
            //TODO: 200ok인 경우에만 로컬에 저장
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
            message: 'fetchCurrentWeatherData 호출 중 오류 발생: $e',
          );
        }

        break;
    }
    bool success = true;
    return Future.value(success);
  });
}
