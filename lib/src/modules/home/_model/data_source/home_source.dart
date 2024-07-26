import 'package:crud/src/models/base/api_response_wrapper.dart';

abstract class HomeSource {
  Future<ApiResponseWrapper<List<dynamic>?>> fetchHomePageData();
}
