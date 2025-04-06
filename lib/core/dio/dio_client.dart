import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:feelcast/core/config/environment.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const int apiTimeOut = 60;

class DioClient {
  final Dio client;

  DioClient() : client = Dio() {
    _configureDio();
    _addLogInterceptors();
    _retryInterceptor();
  }

  void _configureDio() {
    client.options
      ..baseUrl = Environment.publicApiBaseUrl
      ..connectTimeout = const Duration(seconds: apiTimeOut)
      ..receiveTimeout = const Duration(seconds: apiTimeOut);
  }

  void _addLogInterceptors() {
    if (!kReleaseMode) {
      client.interceptors.add(
        PrettyDioLogger(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          requestBody: true,
        ),
      );
    }
  }

  void _retryInterceptor() {
    const maxRetryCount = 3;
    const baseDelaySec = 1;

    List<Duration> exponentialBackoff() {
      return List.generate(
        maxRetryCount,
        (i) => Duration(seconds: baseDelaySec * (2 ^ i)),
      );
    }

    client.interceptors.add(
      RetryInterceptor(
        dio: client,
        logPrint: print,
        retries: maxRetryCount,
        retryDelays: exponentialBackoff(),
        retryEvaluator: (error, attempt) {
          //NOTE 취소된 요청은 제외.
          //네트워크 에러거나, 5xx 서버 에러일 때만 재시도
          return error.type != DioExceptionType.cancel &&
              (error.type == DioExceptionType.connectionError ||
                  (error.response?.statusCode != null &&
                      error.response!.statusCode! >= 500));
        },
      ),
    );
  }
}
