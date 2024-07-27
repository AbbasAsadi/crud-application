import 'package:crud/src/modules/write_article/write_article_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WriteArticleRoutes {
  static const writeArticlePagePath = '/writeArticle';
  static final GlobalKey<NavigatorState> _writeArticleNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'writeArticleNav');

  static StatefulShellBranch pageRoute = StatefulShellBranch(
    navigatorKey: _writeArticleNavigatorKey,
    routes: [
      GoRoute(
        path: writeArticlePagePath,
        builder: (_, __) => const WriteArticlePage(),
      ),
    ],
  );

  static toWriteArticlePage(BuildContext context) {
    context.go(writeArticlePagePath);
  }
}
