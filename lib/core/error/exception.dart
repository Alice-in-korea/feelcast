import 'package:feelcast/support/enum/weather/weather.dart';

class RepositoryException implements Exception {
  final ApiErrorCode code;
  final String? message;

  RepositoryException({required this.code, this.message});

  @override
  String toString() => 'RepoException: $message';
}
