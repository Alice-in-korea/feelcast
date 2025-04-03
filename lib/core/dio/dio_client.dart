import 'package:dio/dio.dart';
import 'package:feelcast/core/config/config.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const int apiTimeOut = 60;

class DioClient {
  final Dio client = Dio();

  DioClient() {
    client
      ..options.baseUrl = Environment.baseUrl
      ..options.connectTimeout = const Duration(seconds: apiTimeOut)
      ..options.receiveTimeout = const Duration(seconds: apiTimeOut)
      ..httpClientAdapter;

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
}
