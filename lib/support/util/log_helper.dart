import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LogHelper {
  LogHelper._();

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static void logInfo(dynamic obj) {
    _logger.i('🍏$obj');
  }

  static void logDebug(dynamic obj) {
    _logger.d('🍏$obj');
  }

  static void logError(Object error) {
    _logger.e('🍏$error', error: error);
  }

  static void logWarning(dynamic obj) {
    _logger.w('🍏$obj');
  }

  static void logDioError(Object obj) {
    switch (obj.runtimeType) {
      case DioException:
        _logger.e('🍏${(obj as DioException).response}');
        break;
      default:
        _logger.e('🍏$obj');
        break;
    }
  }
}
