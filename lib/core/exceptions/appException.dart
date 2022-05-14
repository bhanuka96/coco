import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class NetworkException implements Exception {}

class AbortedException implements Exception {}

class AppException implements Exception {
  String? message;

  AppException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = Strings.requestCancel;
        break;
      case DioErrorType.connectTimeout:
        message = Strings.connectionTimeout;
        break;
      case DioErrorType.other:
        message = Strings.internalServerError;
        break;
      case DioErrorType.receiveTimeout:
        message = Strings.timeoutReceive;
        break;
      case DioErrorType.response:
        message = _handleError(dioError.response?.statusCode);
        break;
      case DioErrorType.sendTimeout:
        message = Strings.timeoutSend;
        break;
      default:
        message = Strings.somethingError;
        break;
    }
  }

  String _handleError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return Strings.badRequest;
      case 404:
        return Strings.resourceNotFound;
      case 500:
        return Strings.internalServerError;
      default:
        return Strings.somethingError;
    }
  }

  @override
  String toString() => message ?? '';
}
