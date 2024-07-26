import 'package:crud/src/modules/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardRoutes {
  static const mainPagePath = '/';

  static RouteBase pageRoute = GoRoute(
    path: mainPagePath,
    builder: (context, state) => const DashboardPage(),
  );

  // static RouteBase pageRoute = StatefulShellRoute.indexedStack(
  //     branches: [
  //       StatefulShellBranch(
  //
  //           routes: routes),
  //     ]
  // );
  static toDashboardPage(BuildContext context) {
    context.go(mainPagePath);
  }
}