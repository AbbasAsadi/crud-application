import 'package:crud/src/core/provider/safe_provider.dart';
import 'package:crud/src/modules/article_detail/_routes/article_routes.dart';
import 'package:crud/src/modules/dashboard/dashboard_provider.dart';
import 'package:crud/src/modules/home/_model/entity/article_response.dart';
import 'package:crud/src/modules/manage_article/_routes/manage_article_routes.dart';
import 'package:provider/provider.dart';

class ManageArticleProvider extends SafeProvider {
  ManageArticleProvider(super.context);

  void onArticleTapped(ArticleResponse article) {
    ArticleRoutes.toArticlePage(context, article);
  }

  void onRemoveTapped(ArticleResponse value) {
    context.read<DashboardProvider>().onRemoveTapped(value);
  }

  void onEditTapped((ArticleResponse, int) value) {
    ManageArticleRoutes.toEditArticlePage(context, value);
  }

}