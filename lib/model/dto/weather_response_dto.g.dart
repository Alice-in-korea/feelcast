// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherResponseDto _$WeatherResponseDtoFromJson(Map<String, dynamic> json) =>
    _WeatherResponseDto(
      response: Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherResponseDtoToJson(_WeatherResponseDto instance) =>
    <String, dynamic>{'response': instance.response};

_Response _$ResponseFromJson(Map<String, dynamic> json) => _Response(
  header: Header.fromJson(json['header'] as Map<String, dynamic>),
  body: Body.fromJson(json['body'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ResponseToJson(_Response instance) => <String, dynamic>{
  'header': instance.header,
  'body': instance.body,
};

_Header _$HeaderFromJson(Map<String, dynamic> json) => _Header(
  resultCode: json['resultCode'] as String,
  resultMsg: json['resultMsg'] as String,
);

Map<String, dynamic> _$HeaderToJson(_Header instance) => <String, dynamic>{
  'resultCode': instance.resultCode,
  'resultMsg': instance.resultMsg,
};

_Body _$BodyFromJson(Map<String, dynamic> json) => _Body(
  dataType: json['dataType'] as String,
  items: Items.fromJson(json['items'] as Map<String, dynamic>),
  pageNo: (json['pageNo'] as num).toInt(),
  numOfRows: (json['numOfRows'] as num).toInt(),
  totalCount: (json['totalCount'] as num).toInt(),
);

Map<String, dynamic> _$BodyToJson(_Body instance) => <String, dynamic>{
  'dataType': instance.dataType,
  'items': instance.items,
  'pageNo': instance.pageNo,
  'numOfRows': instance.numOfRows,
  'totalCount': instance.totalCount,
};

_Items _$ItemsFromJson(Map<String, dynamic> json) => _Items(
  item:
      (json['item'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ItemsToJson(_Items instance) => <String, dynamic>{
  'item': instance.item,
};

_Item _$ItemFromJson(Map<String, dynamic> json) => _Item(
  baseDate: json['baseDate'] as String,
  baseTime: json['baseTime'] as String,
  category: json['category'] as String,
  nx: (json['nx'] as num?)?.toInt(),
  ny: (json['ny'] as num?)?.toInt(),
  obsrValue: json['obsrValue'] as String?,
  fcstDate: json['fcstDate'] as String?,
  fcstTime: json['fcstTime'] as String?,
  fcstValue: json['fcstValue'] as String?,
);

Map<String, dynamic> _$ItemToJson(_Item instance) => <String, dynamic>{
  'baseDate': instance.baseDate,
  'baseTime': instance.baseTime,
  'category': instance.category,
  'nx': instance.nx,
  'ny': instance.ny,
  'obsrValue': instance.obsrValue,
  'fcstDate': instance.fcstDate,
  'fcstTime': instance.fcstTime,
  'fcstValue': instance.fcstValue,
};
