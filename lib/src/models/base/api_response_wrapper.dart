import 'package:crud/src/models/api_error.dart';

import 'api_request_status.dart';

class ApiResponseWrapper<T> {
  ApiRequestStatus status;
  T? data;
  ApiError? error;

  ApiResponseWrapper.notStarted() : status = ApiRequestStatus.notStarted;

  ApiResponseWrapper.loading() : status = ApiRequestStatus.loading;

  ApiResponseWrapper.success(this.data) : status = ApiRequestStatus.success;

  ApiResponseWrapper.error(this.error) : status = ApiRequestStatus.error;

  ApiResponseWrapper({required this.status, this.error, required T? data}) {
    if (status == ApiRequestStatus.success && data != null) {
      this.data = data;
    }
  }

  @override
  String toString() {
    return 'Status : $status \n Message : ${error?.errorMessage} \n Data : $data';
  }
}
