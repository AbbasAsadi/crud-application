import 'package:crud/src/models/base/api_response_wrapper.dart';
import 'package:crud/src/modules/home/_model/entity/article_response.dart';

abstract class HomeRepository {
  Future<ApiResponseWrapper<List<ArticleResponse>?>> fetchHomePageData();
}
