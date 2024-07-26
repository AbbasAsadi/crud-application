import 'package:crud/src/models/base/api_response_wrapper.dart';

import 'home_source.dart';

class HomeMockSource extends HomeSource {
  HomeMockSource();

  @override
  Future<ApiResponseWrapper<List<dynamic>?>> fetchHomePageData() {
    // TODO: implement fetchHomePageData
    throw UnimplementedError();
    // var response = await rootBundle.loadString(Assets.mock.home.homePageData);
    // return ApiResponseWrapper.success(jsonDecode(response));
  }
}
