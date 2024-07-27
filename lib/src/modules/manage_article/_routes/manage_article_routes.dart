import 'package:crud/src/modules/home/_model/entity/article_response.dart';
import 'package:crud/src/modules/manage_article/edit_article/edit_article_page.dart';
import 'package:crud/src/modules/manage_article/manage_article_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ManageArticleRoutes {
  static const _manageArticlePagePath = '/manageArticle';
  static const _editArticlePagePath = 'editArticle';

  static final GlobalKey<NavigatorState> _manageArticleNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'manageArticleNav');

  static StatefulShellBranch pageRoute = StatefulShellBranch(
    navigatorKey: _manageArticleNavigatorKey,
    routes: [
      GoRoute(path: _manageArticlePagePath, builder: (_, __) => const ManageArticlePage(), routes: [
        GoRoute(
          path: _editArticlePagePath,
          builder: (_, state) {
            (ArticleResponse, int) value = state.extra as (ArticleResponse, int);
            return EditArticlePage(inputValue: value);
          },
        )
      ]),
    ],
  );

  static toManageArticlePage(BuildContext context) {
    context.go(_manageArticlePagePath);
  }

  static toEditArticlePage(BuildContext context, (ArticleResponse, int) value) {
    context.go('$_manageArticlePagePath/$_editArticlePagePath', extra: value);
  }
}
