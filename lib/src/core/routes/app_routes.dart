import 'package:go_router/go_router.dart';

class AppRoutes {
  static var routeConfig = GoRouter(
    initialLocation: SplashRoutes.splashPagePath,
    debugLogDiagnostics: true,
    routes: _routeList,
  );

  static final List<RouteBase> _routeList = [
    SplashRoutes.route,
    HomeRoutes.pageRoute,
    ArticaleRoutes.pageRoute,
  ];
}