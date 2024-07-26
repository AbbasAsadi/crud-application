import 'dart:developer';

import 'package:crud/src/models/api_error.dart';

class LogError {
  static void showInterceptorAPIError(ApiError error) {
    log('\n\n');
    log('/*/*/*/*/*/*/*/*/*/*/*/* ${error.errorType.toPrettyDescription()} */*/*/*/*/*/*/*/*/*/*/*/');
    log('ROOT: ${error.requestOptions.path}');
    log('MESSAGE: ${error.errorMessage}');
    log('/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/');
    log('\n\n');
  }
}
