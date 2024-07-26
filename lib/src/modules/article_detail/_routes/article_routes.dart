import 'package:crud/src/modules/article_detail/article_page.dart';
import 'package:crud/src/modules/home/_model/entity/article_response.dart';
import 'package:crud/src/modules/home/routes/home_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArticleRoutes {
  static const _articlePagePath = 'article';

  static RouteBase pageRoute = GoRoute(
    path: _articlePagePath,
    builder: (_, state) {
      ArticleResponse article = state.extra as ArticleResponse;
      return ArticlePage(article: article);
    },
  );

  static toArticlePage(BuildContext context, ArticleResponse article) {
    context.go('${HomeRoutes.homePagePath}$_articlePagePath', extra: article);
  }
}
