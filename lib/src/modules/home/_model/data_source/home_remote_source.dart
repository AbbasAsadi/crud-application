import 'package:crud/src/core/api/core_api.dart';
import 'package:crud/src/core/api/dio_method.dart';
import 'package:crud/src/models/base/api_response_wrapper.dart';

import 'home_source.dart';

class HomeRemoteSource extends HomeSource {
  final _api = CoreApi();

  @override
  Future<ApiResponseWrapper<List<dynamic>?>> fetchHomePageData() async {
    var response = await _api.call(
      '',
      method: ApiMethod.get,
      queryParameters: {'type': 'meat-and-filler', 'paras': 10},
    );
    if(response is ApiResponseWrapper<List<dynamic>?>) {
      return response;
    }else {
      return ApiResponseWrapper.error(null);
    }
  }
}
