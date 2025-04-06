import 'package:feelcast/support/enum/weather/weather.dart';

const successAndHasDataCode = '00';
const apiErrorUnknownCode = '99';

ApiErrorCode getApiErrorCode(String code) {
  switch (code) {
    case '00':
      return ApiErrorCode.normalService;
    case '01':
      return ApiErrorCode.applicationError;
    case '02':
      return ApiErrorCode.dbError;
    case '03':
      return ApiErrorCode.noDataError;
    case '04':
      return ApiErrorCode.httpError;
    case '05':
      return ApiErrorCode.serviceTimeOut;
    case '10':
      return ApiErrorCode.invalidRequestParameterError;
    case '11':
      return ApiErrorCode.noMandatoryRequestParametersError;
    case '12':
      return ApiErrorCode.noOpenApiServiceError;
    case '20':
      return ApiErrorCode.serviceAccessDeniedError;
    case '21':
      return ApiErrorCode.temporarilyDisableTheServiceKeyError;
    case '22':
      return ApiErrorCode.limitedNumberOfServiceRequestsExceedsError;
    case '30':
      return ApiErrorCode.serviceKeyIsNotRegisteredError;
    case '31':
      return ApiErrorCode.deadlineHasExpiredError;
    case '32':
      return ApiErrorCode.unregisteredIpError;
    case '33':
      return ApiErrorCode.unsignedCallError;
    case '99':
    default:
      return ApiErrorCode.unknownError;
  }
}
