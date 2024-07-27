import 'package:crud/src/core/provider/safe_provider.dart';
import 'package:crud/src/modules/home/_model/entity/article_response.dart';

class DashboardProvider extends SafeProvider {
  DashboardProvider(super.context);

  List<ArticleResponse> yourArticles = [];

  void addArticle(ArticleResponse article) {
    yourArticles.add(article);
    notifyListeners();
  }

  void onRemoveTapped(ArticleResponse value) {
    yourArticles.remove(value);
    notifyListeners();
  }

  void onEditTapped(ArticleResponse newValue, int index) {
    yourArticles.removeAt(index);
    notifyListeners();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        yourArticles.insert(index, newValue);
        notifyListeners();
      },
    );
  }
}
