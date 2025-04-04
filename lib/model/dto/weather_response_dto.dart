import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_response_dto.freezed.dart';
part 'weather_response_dto.g.dart';

@freezed
abstract class WeatherResponseDto with _$WeatherResponseDto {
  const factory WeatherResponseDto({required Response response}) =
      _WeatherResponseDto;

  factory WeatherResponseDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseDtoFromJson(json);
}

@freezed
abstract class Response with _$Response {
  const factory Response({required Header header, required Body body}) =
      _Response;

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
}

@freezed
abstract class Header with _$Header {
  const factory Header({
    required String resultCode,
    required String resultMsg,
  }) = _Header;

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
}

@freezed
abstract class Body with _$Body {
  const factory Body({
    required String dataType,
    required Items items,
    required int pageNo,
    required int numOfRows,
    required int totalCount,
  }) = _Body;

  factory Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);
}

@freezed
abstract class Items with _$Items {
  const factory Items({required List<Item> item}) = _Items;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
}

@freezed
abstract class Item with _$Item {
  const factory Item({
    required String baseDate,
    required String baseTime,
    required String category,
    int? nx,
    int? ny,
    String? obsrValue, // 관측값
    String? fcstDate, // 예보 날짜
    String? fcstTime, // 예보 시간
    String? fcstValue, // 예보값
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
