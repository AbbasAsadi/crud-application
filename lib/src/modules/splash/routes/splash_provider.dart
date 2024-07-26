import 'package:crud/src/core/provider/safe_provider.dart';
import 'package:crud/src/modules/dashboard/routes/dashboard_routes.dart';

class SplashProvider extends SafeProvider {
  SplashProvider(super.context) {
    initialize();
  }

  Future<void> initialize() async {
    Future.delayed(
      const Duration(seconds: 3),
      () => DashboardRoutes.toDashboardPage(context),
    );
  }
}
