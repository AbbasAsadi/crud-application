import 'package:crud/src/modules/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

class SplashRoutes {
  static const splashPagePath = '/splash';
  static RouteBase route = GoRoute(
    path: splashPagePath,
    builder: (_, __) => const SplashPage(),
  );
}