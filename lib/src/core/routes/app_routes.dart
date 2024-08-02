import 'package:crud/src/modules/article_detail/_routes/article_routes.dart';
import 'package:crud/src/modules/dashboard/_routes/dashboard_routes.dart';
import 'package:crud/src/modules/splash/_routes/splash_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  static var routeConfig = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: SplashRoutes.splashPagePath,
    debugLogDiagnostics: true,
    routes: _routeList,
  );

  static final List<RouteBase> _routeList = [
    SplashRoutes.route,
    DashboardRoutes.pageRoute,
    ArticleRoutes.pageRoute,
    // HomeRoutes.pageRoute,
  ];
}
