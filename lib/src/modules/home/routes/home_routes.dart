import 'package:crud/src/modules/article_detail/_routes/article_routes.dart';
import 'package:crud/src/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeRoutes {
  static const homePagePath = '/';

  static RouteBase pageRoute = GoRoute(
    path: homePagePath,
    builder: (context, state) => const HomePage(),
    routes: [
      ArticleRoutes.pageRoute
    ]
  );

  static toHomePage(BuildContext context) {
    context.go(homePagePath);
  }
}