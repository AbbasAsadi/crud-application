import 'package:crud/src/models/base/api_response_wrapper.dart';
import 'package:crud/src/modules/home/_model/data_source/home_source.dart';
import 'package:crud/src/modules/home/_model/entity/article_response.dart';
import 'package:crud/src/modules/home/_model/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeSource _remoteSource;

  HomeRepositoryImpl(this._remoteSource);

  @override
  Future<ApiResponseWrapper<List<ArticleResponse>?>> fetchHomePageData() async {
    var response = await _remoteSource.fetchHomePageData();
    List<ArticleResponse> formattedResponse = [];
    if(response.data != null) {
      for (var item in response.data!){
        formattedResponse.add(ArticleResponse.fromBody(item));
      }
    }
    return ApiResponseWrapper(
      status: response.status,
      error: response.error,
      data: formattedResponse,
    );
  }
}
