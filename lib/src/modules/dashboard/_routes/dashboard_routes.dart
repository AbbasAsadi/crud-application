import 'package:crud/src/modules/dashboard/dashboard_page.dart';
import 'package:crud/src/modules/home/_routes/home_routes.dart';
import 'package:crud/src/modules/manage_article/_routes/manage_article_routes.dart';
import 'package:crud/src/modules/write_article/_routes/write_article_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardRoutes {
  static const dashboardPagePath = '/';

  static RouteBase pageRoute = StatefulShellRoute.indexedStack(
    builder: (BuildContext _, __, navigationShell) => DashboardPage(navigationShell: navigationShell),
    branches: [
      HomeRoutes.pageRoute,
      WriteArticleRoutes.pageRoute,
      ManageArticleRoutes.pageRoute,
    ],
  );

  static toDashboardPage(BuildContext context) {
    context.go(dashboardPagePath);
  }
}
