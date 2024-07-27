import 'package:crud/src/modules/manage_article/manage_article_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ManageArticleRoutes {
  static const manageArticlePagePath = '/manageArticle';
  static final GlobalKey<NavigatorState> _manageArticleNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'manageArticleNav');

  static StatefulShellBranch pageRoute = StatefulShellBranch(
    navigatorKey: _manageArticleNavigatorKey,
    routes: [
      GoRoute(
        path: manageArticlePagePath,
        builder: (_, __) => const ManageArticlePage(),
      ),
    ],
  );

  static toManageArticlePage(BuildContext context) {
    context.go(manageArticlePagePath);
  }
}
