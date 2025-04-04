// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherResponseDto {

 Response get response;
/// Create a copy of WeatherResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherResponseDtoCopyWith<WeatherResponseDto> get copyWith => _$WeatherResponseDtoCopyWithImpl<WeatherResponseDto>(this as WeatherResponseDto, _$identity);

  /// Serializes this WeatherResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherResponseDto&&(identical(other.response, response) || other.response == response));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'WeatherResponseDto(response: $response)';
}


}

/// @nodoc
abstract mixin class $WeatherResponseDtoCopyWith<$Res>  {
  factory $WeatherResponseDtoCopyWith(WeatherResponseDto value, $Res Function(WeatherResponseDto) _then) = _$WeatherResponseDtoCopyWithImpl;
@useResult
$Res call({
 Response response
});


$ResponseCopyWith<$Res> get response;

}
/// @nodoc
class _$WeatherResponseDtoCopyWithImpl<$Res>
    implements $WeatherResponseDtoCopyWith<$Res> {
  _$WeatherResponseDtoCopyWithImpl(this._self, this._then);

  final WeatherResponseDto _self;
  final $Res Function(WeatherResponseDto) _then;

/// Create a copy of WeatherResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? response = null,}) {
  return _then(_self.copyWith(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response,
  ));
}
/// Create a copy of WeatherResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponseCopyWith<$Res> get response {
  
  return $ResponseCopyWith<$Res>(_self.response, (value) {
    return _then(_self.copyWith(response: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _WeatherResponseDto implements WeatherResponseDto {
  const _WeatherResponseDto({required this.response});
  factory _WeatherResponseDto.fromJson(Map<String, dynamic> json) => _$WeatherResponseDtoFromJson(json);

@override final  Response response;

/// Create a copy of WeatherResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherResponseDtoCopyWith<_WeatherResponseDto> get copyWith => __$WeatherResponseDtoCopyWithImpl<_WeatherResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherResponseDto&&(identical(other.response, response) || other.response == response));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'WeatherResponseDto(response: $response)';
}


}

/// @nodoc
abstract mixin class _$WeatherResponseDtoCopyWith<$Res> implements $WeatherResponseDtoCopyWith<$Res> {
  factory _$WeatherResponseDtoCopyWith(_WeatherResponseDto value, $Res Function(_WeatherResponseDto) _then) = __$WeatherResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 Response response
});


@override $ResponseCopyWith<$Res> get response;

}
/// @nodoc
class __$WeatherResponseDtoCopyWithImpl<$Res>
    implements _$WeatherResponseDtoCopyWith<$Res> {
  __$WeatherResponseDtoCopyWithImpl(this._self, this._then);

  final _WeatherResponseDto _self;
  final $Res Function(_WeatherResponseDto) _then;

/// Create a copy of WeatherResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(_WeatherResponseDto(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as Response,
  ));
}

/// Create a copy of WeatherResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResponseCopyWith<$Res> get response {
  
  return $ResponseCopyWith<$Res>(_self.response, (value) {
    return _then(_self.copyWith(response: value));
  });
}
}


/// @nodoc
mixin _$Response {

 Header get header; Body get body;
/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponseCopyWith<Response> get copyWith => _$ResponseCopyWithImpl<Response>(this as Response, _$identity);

  /// Serializes this Response to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Response&&(identical(other.header, header) || other.header == header)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,header,body);

@override
String toString() {
  return 'Response(header: $header, body: $body)';
}


}

/// @nodoc
abstract mixin class $ResponseCopyWith<$Res>  {
  factory $ResponseCopyWith(Response value, $Res Function(Response) _then) = _$ResponseCopyWithImpl;
@useResult
$Res call({
 Header header, Body body
});


$HeaderCopyWith<$Res> get header;$BodyCopyWith<$Res> get body;

}
/// @nodoc
class _$ResponseCopyWithImpl<$Res>
    implements $ResponseCopyWith<$Res> {
  _$ResponseCopyWithImpl(this._self, this._then);

  final Response _self;
  final $Res Function(Response) _then;

/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? header = null,Object? body = null,}) {
  return _then(_self.copyWith(
header: null == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as Header,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as Body,
  ));
}
/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HeaderCopyWith<$Res> get header {
  
  return $HeaderCopyWith<$Res>(_self.header, (value) {
    return _then(_self.copyWith(header: value));
  });
}/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BodyCopyWith<$Res> get body {
  
  return $BodyCopyWith<$Res>(_self.body, (value) {
    return _then(_self.copyWith(body: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Response implements Response {
  const _Response({required this.header, required this.body});
  factory _Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);

@override final  Header header;
@override final  Body body;

/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResponseCopyWith<_Response> get copyWith => __$ResponseCopyWithImpl<_Response>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Response&&(identical(other.header, header) || other.header == header)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,header,body);

@override
String toString() {
  return 'Response(header: $header, body: $body)';
}


}

/// @nodoc
abstract mixin class _$ResponseCopyWith<$Res> implements $ResponseCopyWith<$Res> {
  factory _$ResponseCopyWith(_Response value, $Res Function(_Response) _then) = __$ResponseCopyWithImpl;
@override @useResult
$Res call({
 Header header, Body body
});


@override $HeaderCopyWith<$Res> get header;@override $BodyCopyWith<$Res> get body;

}
/// @nodoc
class __$ResponseCopyWithImpl<$Res>
    implements _$ResponseCopyWith<$Res> {
  __$ResponseCopyWithImpl(this._self, this._then);

  final _Response _self;
  final $Res Function(_Response) _then;

/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? header = null,Object? body = null,}) {
  return _then(_Response(
header: null == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as Header,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as Body,
  ));
}

/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HeaderCopyWith<$Res> get header {
  
  return $HeaderCopyWith<$Res>(_self.header, (value) {
    return _then(_self.copyWith(header: value));
  });
}/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BodyCopyWith<$Res> get body {
  
  return $BodyCopyWith<$Res>(_self.body, (value) {
    return _then(_self.copyWith(body: value));
  });
}
}


/// @nodoc
mixin _$Header {

 String get resultCode; String get resultMsg;
/// Create a copy of Header
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeaderCopyWith<Header> get copyWith => _$HeaderCopyWithImpl<Header>(this as Header, _$identity);

  /// Serializes this Header to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Header&&(identical(other.resultCode, resultCode) || other.resultCode == resultCode)&&(identical(other.resultMsg, resultMsg) || other.resultMsg == resultMsg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resultCode,resultMsg);

@override
String toString() {
  return 'Header(resultCode: $resultCode, resultMsg: $resultMsg)';
}


}

/// @nodoc
abstract mixin class $HeaderCopyWith<$Res>  {
  factory $HeaderCopyWith(Header value, $Res Function(Header) _then) = _$HeaderCopyWithImpl;
@useResult
$Res call({
 String resultCode, String resultMsg
});




}
/// @nodoc
class _$HeaderCopyWithImpl<$Res>
    implements $HeaderCopyWith<$Res> {
  _$HeaderCopyWithImpl(this._self, this._then);

  final Header _self;
  final $Res Function(Header) _then;

/// Create a copy of Header
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resultCode = null,Object? resultMsg = null,}) {
  return _then(_self.copyWith(
resultCode: null == resultCode ? _self.resultCode : resultCode // ignore: cast_nullable_to_non_nullable
as String,resultMsg: null == resultMsg ? _self.resultMsg : resultMsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Header implements Header {
  const _Header({required this.resultCode, required this.resultMsg});
  factory _Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);

@override final  String resultCode;
@override final  String resultMsg;

/// Create a copy of Header
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeaderCopyWith<_Header> get copyWith => __$HeaderCopyWithImpl<_Header>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HeaderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Header&&(identical(other.resultCode, resultCode) || other.resultCode == resultCode)&&(identical(other.resultMsg, resultMsg) || other.resultMsg == resultMsg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resultCode,resultMsg);

@override
String toString() {
  return 'Header(resultCode: $resultCode, resultMsg: $resultMsg)';
}


}

/// @nodoc
abstract mixin class _$HeaderCopyWith<$Res> implements $HeaderCopyWith<$Res> {
  factory _$HeaderCopyWith(_Header value, $Res Function(_Header) _then) = __$HeaderCopyWithImpl;
@override @useResult
$Res call({
 String resultCode, String resultMsg
});




}
/// @nodoc
class __$HeaderCopyWithImpl<$Res>
    implements _$HeaderCopyWith<$Res> {
  __$HeaderCopyWithImpl(this._self, this._then);

  final _Header _self;
  final $Res Function(_Header) _then;

/// Create a copy of Header
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resultCode = null,Object? resultMsg = null,}) {
  return _then(_Header(
resultCode: null == resultCode ? _self.resultCode : resultCode // ignore: cast_nullable_to_non_nullable
as String,resultMsg: null == resultMsg ? _self.resultMsg : resultMsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Body {

 String get dataType; Items get items; int get pageNo; int get numOfRows; int get totalCount;
/// Create a copy of Body
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BodyCopyWith<Body> get copyWith => _$BodyCopyWithImpl<Body>(this as Body, _$identity);

  /// Serializes this Body to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Body&&(identical(other.dataType, dataType) || other.dataType == dataType)&&(identical(other.items, items) || other.items == items)&&(identical(other.pageNo, pageNo) || other.pageNo == pageNo)&&(identical(other.numOfRows, numOfRows) || other.numOfRows == numOfRows)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dataType,items,pageNo,numOfRows,totalCount);

@override
String toString() {
  return 'Body(dataType: $dataType, items: $items, pageNo: $pageNo, numOfRows: $numOfRows, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $BodyCopyWith<$Res>  {
  factory $BodyCopyWith(Body value, $Res Function(Body) _then) = _$BodyCopyWithImpl;
@useResult
$Res call({
 String dataType, Items items, int pageNo, int numOfRows, int totalCount
});


$ItemsCopyWith<$Res> get items;

}
/// @nodoc
class _$BodyCopyWithImpl<$Res>
    implements $BodyCopyWith<$Res> {
  _$BodyCopyWithImpl(this._self, this._then);

  final Body _self;
  final $Res Function(Body) _then;

/// Create a copy of Body
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dataType = null,Object? items = null,Object? pageNo = null,Object? numOfRows = null,Object? totalCount = null,}) {
  return _then(_self.copyWith(
dataType: null == dataType ? _self.dataType : dataType // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as Items,pageNo: null == pageNo ? _self.pageNo : pageNo // ignore: cast_nullable_to_non_nullable
as int,numOfRows: null == numOfRows ? _self.numOfRows : numOfRows // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of Body
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ItemsCopyWith<$Res> get items {
  
  return $ItemsCopyWith<$Res>(_self.items, (value) {
    return _then(_self.copyWith(items: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Body implements Body {
  const _Body({required this.dataType, required this.items, required this.pageNo, required this.numOfRows, required this.totalCount});
  factory _Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);

@override final  String dataType;
@override final  Items items;
@override final  int pageNo;
@override final  int numOfRows;
@override final  int totalCount;

/// Create a copy of Body
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BodyCopyWith<_Body> get copyWith => __$BodyCopyWithImpl<_Body>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Body&&(identical(other.dataType, dataType) || other.dataType == dataType)&&(identical(other.items, items) || other.items == items)&&(identical(other.pageNo, pageNo) || other.pageNo == pageNo)&&(identical(other.numOfRows, numOfRows) || other.numOfRows == numOfRows)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dataType,items,pageNo,numOfRows,totalCount);

@override
String toString() {
  return 'Body(dataType: $dataType, items: $items, pageNo: $pageNo, numOfRows: $numOfRows, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$BodyCopyWith<$Res> implements $BodyCopyWith<$Res> {
  factory _$BodyCopyWith(_Body value, $Res Function(_Body) _then) = __$BodyCopyWithImpl;
@override @useResult
$Res call({
 String dataType, Items items, int pageNo, int numOfRows, int totalCount
});


@override $ItemsCopyWith<$Res> get items;

}
/// @nodoc
class __$BodyCopyWithImpl<$Res>
    implements _$BodyCopyWith<$Res> {
  __$BodyCopyWithImpl(this._self, this._then);

  final _Body _self;
  final $Res Function(_Body) _then;

/// Create a copy of Body
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dataType = null,Object? items = null,Object? pageNo = null,Object? numOfRows = null,Object? totalCount = null,}) {
  return _then(_Body(
dataType: null == dataType ? _self.dataType : dataType // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as Items,pageNo: null == pageNo ? _self.pageNo : pageNo // ignore: cast_nullable_to_non_nullable
as int,numOfRows: null == numOfRows ? _self.numOfRows : numOfRows // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of Body
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ItemsCopyWith<$Res> get items {
  
  return $ItemsCopyWith<$Res>(_self.items, (value) {
    return _then(_self.copyWith(items: value));
  });
}
}


/// @nodoc
mixin _$Items {

 List<Item> get item;
/// Create a copy of Items
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemsCopyWith<Items> get copyWith => _$ItemsCopyWithImpl<Items>(this as Items, _$identity);

  /// Serializes this Items to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Items&&const DeepCollectionEquality().equals(other.item, item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(item));

@override
String toString() {
  return 'Items(item: $item)';
}


}

/// @nodoc
abstract mixin class $ItemsCopyWith<$Res>  {
  factory $ItemsCopyWith(Items value, $Res Function(Items) _then) = _$ItemsCopyWithImpl;
@useResult
$Res call({
 List<Item> item
});




}
/// @nodoc
class _$ItemsCopyWithImpl<$Res>
    implements $ItemsCopyWith<$Res> {
  _$ItemsCopyWithImpl(this._self, this._then);

  final Items _self;
  final $Res Function(Items) _then;

/// Create a copy of Items
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,}) {
  return _then(_self.copyWith(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as List<Item>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Items implements Items {
  const _Items({required final  List<Item> item}): _item = item;
  factory _Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

 final  List<Item> _item;
@override List<Item> get item {
  if (_item is EqualUnmodifiableListView) return _item;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_item);
}


/// Create a copy of Items
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemsCopyWith<_Items> get copyWith => __$ItemsCopyWithImpl<_Items>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Items&&const DeepCollectionEquality().equals(other._item, _item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_item));

@override
String toString() {
  return 'Items(item: $item)';
}


}

/// @nodoc
abstract mixin class _$ItemsCopyWith<$Res> implements $ItemsCopyWith<$Res> {
  factory _$ItemsCopyWith(_Items value, $Res Function(_Items) _then) = __$ItemsCopyWithImpl;
@override @useResult
$Res call({
 List<Item> item
});




}
/// @nodoc
class __$ItemsCopyWithImpl<$Res>
    implements _$ItemsCopyWith<$Res> {
  __$ItemsCopyWithImpl(this._self, this._then);

  final _Items _self;
  final $Res Function(_Items) _then;

/// Create a copy of Items
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_Items(
item: null == item ? _self._item : item // ignore: cast_nullable_to_non_nullable
as List<Item>,
  ));
}


}


/// @nodoc
mixin _$Item {

 String get baseDate; String get baseTime; String get category; int? get nx; int? get ny; String? get obsrValue;// 관측값
 String? get fcstDate;// 예보 날짜
 String? get fcstTime;// 예보 시간
 String? get fcstValue;
/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemCopyWith<Item> get copyWith => _$ItemCopyWithImpl<Item>(this as Item, _$identity);

  /// Serializes this Item to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Item&&(identical(other.baseDate, baseDate) || other.baseDate == baseDate)&&(identical(other.baseTime, baseTime) || other.baseTime == baseTime)&&(identical(other.category, category) || other.category == category)&&(identical(other.nx, nx) || other.nx == nx)&&(identical(other.ny, ny) || other.ny == ny)&&(identical(other.obsrValue, obsrValue) || other.obsrValue == obsrValue)&&(identical(other.fcstDate, fcstDate) || other.fcstDate == fcstDate)&&(identical(other.fcstTime, fcstTime) || other.fcstTime == fcstTime)&&(identical(other.fcstValue, fcstValue) || other.fcstValue == fcstValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseDate,baseTime,category,nx,ny,obsrValue,fcstDate,fcstTime,fcstValue);

@override
String toString() {
  return 'Item(baseDate: $baseDate, baseTime: $baseTime, category: $category, nx: $nx, ny: $ny, obsrValue: $obsrValue, fcstDate: $fcstDate, fcstTime: $fcstTime, fcstValue: $fcstValue)';
}


}

/// @nodoc
abstract mixin class $ItemCopyWith<$Res>  {
  factory $ItemCopyWith(Item value, $Res Function(Item) _then) = _$ItemCopyWithImpl;
@useResult
$Res call({
 String baseDate, String baseTime, String category, int? nx, int? ny, String? obsrValue, String? fcstDate, String? fcstTime, String? fcstValue
});




}
/// @nodoc
class _$ItemCopyWithImpl<$Res>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._self, this._then);

  final Item _self;
  final $Res Function(Item) _then;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baseDate = null,Object? baseTime = null,Object? category = null,Object? nx = freezed,Object? ny = freezed,Object? obsrValue = freezed,Object? fcstDate = freezed,Object? fcstTime = freezed,Object? fcstValue = freezed,}) {
  return _then(_self.copyWith(
baseDate: null == baseDate ? _self.baseDate : baseDate // ignore: cast_nullable_to_non_nullable
as String,baseTime: null == baseTime ? _self.baseTime : baseTime // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,nx: freezed == nx ? _self.nx : nx // ignore: cast_nullable_to_non_nullable
as int?,ny: freezed == ny ? _self.ny : ny // ignore: cast_nullable_to_non_nullable
as int?,obsrValue: freezed == obsrValue ? _self.obsrValue : obsrValue // ignore: cast_nullable_to_non_nullable
as String?,fcstDate: freezed == fcstDate ? _self.fcstDate : fcstDate // ignore: cast_nullable_to_non_nullable
as String?,fcstTime: freezed == fcstTime ? _self.fcstTime : fcstTime // ignore: cast_nullable_to_non_nullable
as String?,fcstValue: freezed == fcstValue ? _self.fcstValue : fcstValue // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Item implements Item {
  const _Item({required this.baseDate, required this.baseTime, required this.category, this.nx, this.ny, this.obsrValue, this.fcstDate, this.fcstTime, this.fcstValue});
  factory _Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

@override final  String baseDate;
@override final  String baseTime;
@override final  String category;
@override final  int? nx;
@override final  int? ny;
@override final  String? obsrValue;
// 관측값
@override final  String? fcstDate;
// 예보 날짜
@override final  String? fcstTime;
// 예보 시간
@override final  String? fcstValue;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemCopyWith<_Item> get copyWith => __$ItemCopyWithImpl<_Item>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Item&&(identical(other.baseDate, baseDate) || other.baseDate == baseDate)&&(identical(other.baseTime, baseTime) || other.baseTime == baseTime)&&(identical(other.category, category) || other.category == category)&&(identical(other.nx, nx) || other.nx == nx)&&(identical(other.ny, ny) || other.ny == ny)&&(identical(other.obsrValue, obsrValue) || other.obsrValue == obsrValue)&&(identical(other.fcstDate, fcstDate) || other.fcstDate == fcstDate)&&(identical(other.fcstTime, fcstTime) || other.fcstTime == fcstTime)&&(identical(other.fcstValue, fcstValue) || other.fcstValue == fcstValue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseDate,baseTime,category,nx,ny,obsrValue,fcstDate,fcstTime,fcstValue);

@override
String toString() {
  return 'Item(baseDate: $baseDate, baseTime: $baseTime, category: $category, nx: $nx, ny: $ny, obsrValue: $obsrValue, fcstDate: $fcstDate, fcstTime: $fcstTime, fcstValue: $fcstValue)';
}


}

/// @nodoc
abstract mixin class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) _then) = __$ItemCopyWithImpl;
@override @useResult
$Res call({
 String baseDate, String baseTime, String category, int? nx, int? ny, String? obsrValue, String? fcstDate, String? fcstTime, String? fcstValue
});




}
/// @nodoc
class __$ItemCopyWithImpl<$Res>
    implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(this._self, this._then);

  final _Item _self;
  final $Res Function(_Item) _then;

/// Create a copy of Item
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baseDate = null,Object? baseTime = null,Object? category = null,Object? nx = freezed,Object? ny = freezed,Object? obsrValue = freezed,Object? fcstDate = freezed,Object? fcstTime = freezed,Object? fcstValue = freezed,}) {
  return _then(_Item(
baseDate: null == baseDate ? _self.baseDate : baseDate // ignore: cast_nullable_to_non_nullable
as String,baseTime: null == baseTime ? _self.baseTime : baseTime // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,nx: freezed == nx ? _self.nx : nx // ignore: cast_nullable_to_non_nullable
as int?,ny: freezed == ny ? _self.ny : ny // ignore: cast_nullable_to_non_nullable
as int?,obsrValue: freezed == obsrValue ? _self.obsrValue : obsrValue // ignore: cast_nullable_to_non_nullable
as String?,fcstDate: freezed == fcstDate ? _self.fcstDate : fcstDate // ignore: cast_nullable_to_non_nullable
as String?,fcstTime: freezed == fcstTime ? _self.fcstTime : fcstTime // ignore: cast_nullable_to_non_nullable
as String?,fcstValue: freezed == fcstValue ? _self.fcstValue : fcstValue // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
