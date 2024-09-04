import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:nytimes_feed/Data/utils/dioError.Ext.dart';
import 'package:nytimes_feed/Domain/Exceptions/customException.dart';

CustomException mapToCustomException(Object e) {
  if (e is DioException) {
    return CustomException(
        friendlyMessage: e.dioFriendlyException,
        innerException: e,
        retryable: e.isDioReqRetryable,
        response: e.response);
  }

  return CustomException(
      friendlyMessage: _friendlyExceptionMessage(e),
      innerException: Exception("Unknown error, type:${e.runtimeType}"));
}

String _friendlyExceptionMessage(Object exception) {
  switch (exception.runtimeType) {
    case DioException:
      return "Unknown network error occurred"; // Fallback for DioException

    case TypeError:
      return "Unexpected Server Response";

    case SocketException:
      return "Connection error";

    case HttpException:
      return "Protocol Error";

    case PlatformException:
      return "Platform Exception Occurred";

    case TimeoutException:
      return "Server is not responding";

    // case Error:
    default:
      return "Unknown error occurred";
  }
}
