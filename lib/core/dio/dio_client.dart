import 'package:dio/dio.dart';
import 'package:feelcast/core/config/environment.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const int apiTimeOut = 60;

class DioClient {
  final Dio client;

  DioClient() : client = Dio() {
    _configureDio();
    _addLogInterceptors();
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
}
