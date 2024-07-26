import 'package:crud/src/models/api_error.dart';
import 'package:crud/src/models/base/api_request_status.dart';
import 'package:crud/src/models/base/api_response_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ApiService {
  Future<ApiResponseWrapper<T>> callApi<T>(
    Future<ApiResponseWrapper<T>> job, {
    ValueGetter? onLoading,
    ValueGetter? onUnauthenticated,
    ValueChanged<ApiResponseWrapper<T>>? onSuccess,
    ValueChanged<ApiError>? onError,
  }) async {
    if (onLoading != null) {
      onLoading();
    }
    var result = await job;
    if (result.status == ApiRequestStatus.success) {
      if (onSuccess != null) {
        onSuccess(result);
      }
    } else if (result.status == ApiRequestStatus.unauthorized) {
      if (onUnauthenticated != null) {
        onUnauthenticated();
      }
    } else if (result.status == ApiRequestStatus.error) {
      if (onError != null && result.error != null) {
        onError(result.error!);
      }
    }

    return result;
  }
}
