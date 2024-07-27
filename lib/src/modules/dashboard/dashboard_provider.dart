import 'package:crud/src/core/provider/safe_provider.dart';
import 'package:crud/src/modules/home/_model/entity/article_response.dart';
import 'package:go_router/go_router.dart';

class DashboardProvider extends SafeProvider {
  DashboardProvider(super.context, this.navigationShell);

  List<ArticleResponse> yourArticles = [];
  StatefulNavigationShell navigationShell;
  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void onBottomNavBarItemTap(int index, StatefulNavigationShell navigationShell) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
