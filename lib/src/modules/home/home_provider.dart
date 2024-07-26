import 'package:crud/locator.dart';
import 'package:crud/src/core/api/api_service.dart';
import 'package:crud/src/core/provider/safe_provider.dart';
import 'package:crud/src/models/base/api_response_wrapper.dart';
import 'package:crud/src/modules/home/_model/entity/article_response.dart';
import 'package:crud/src/modules/home/_model/repository/home_repository.dart';

class HomeProvider extends SafeProvider {
  final HomeRepository _repository = locator();
  ApiResponseWrapper<List<ArticleResponse>?> homeResponse = ApiResponseWrapper<List<ArticleResponse>>.notStarted();

  HomeProvider(super.context) {
    initialize();
  }

  void initialize() {
    _fetchHomeData();
  }

  Future<void> _fetchHomeData() async {
    homeResponse = ApiResponseWrapper.loading();
    notifyListeners();

    homeResponse = await ApiService().callApi(
      _repository.fetchHomePageData(),
    );
    notifyListeners();
  }
}
