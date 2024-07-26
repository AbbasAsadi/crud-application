import 'dart:io';

import 'package:crud/src/helper/log_error.dart';
import 'package:crud/src/models/api_error.dart';
import 'package:crud/src/models/base/api_response_wrapper.dart';
import 'package:dio/dio.dart';

class DioInterceptors extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Add token to header
    /*   final token = await locator<SecureStorage>().accessToken;
    if (token != null) {
      options.headers["access"] = token;
    }*/
    options.headers["Content-Type"] = "application/json";
    options.headers["Accept"] = "*/*";
    options.contentType = ContentType.json.mimeType;

    handler.next(options);
    // super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final List responseBody = response.data;

    if (isOk(response.statusCode)) {
      response.data = ApiResponseWrapper<List>.success(responseBody);
    } else if (response.statusCode == 401) {
      // locator<AuthLocalSource>().logout();
      //TODO LOGOUT REQUEST SHOULD BE CALL
      response.data = ApiResponseWrapper<Map<String, dynamic>?>.error(
        ApiError(
          401,
          'unauthorized',
          requestOptions: response.requestOptions,
          errorType: ApiErrorType.unAuthorized,
        ),
      );
    } else if (hasError(response.statusCode)) {
      response.data = ApiResponseWrapper<Map<String, dynamic>?>.error(
        ApiError(
         response.statusCode,
          responseBody.toString(),
          requestOptions: response.requestOptions,
          errorType: ApiErrorType.remoteError,
        ),
      );
    } else if (hasServerError(response.statusCode)) {
      response.data = ApiResponseWrapper<Map<String, dynamic>?>.error(
        ApiError(
          response.statusCode,
          responseBody.toString(),
          requestOptions: response.requestOptions,
          errorType: ApiErrorType.serverError,
        ),
      );
    }
    if ((response.data as ApiResponseWrapper).error != null) {
      LogError.showInterceptorAPIError(response.data.error!);
    }
    handler.next(response);
  }

  bool isOk(int? statusCode) {
    return (((statusCode ?? 0) >= 200) && (statusCode ?? 0) < 300);
  }

  bool hasError(int? statusCode) {
    return (((statusCode ?? 0) >= 400) && (statusCode ?? 0) < 500);
  }

  bool hasServerError(int? statusCode) {
    return (((statusCode ?? 0) >= 500) && (statusCode ?? 0) < 600);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Response response = Response(requestOptions: err.requestOptions);
    response.data = ApiResponseWrapper<Map<String, dynamic>?>.error(ApiError.fromDioException(err));
    LogError.showInterceptorAPIError(response.data.error!);
    handler.resolve(response);
  }
}
