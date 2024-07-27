import 'package:crud/gen/assets.gen.dart';
import 'package:crud/src/modules/dashboard/dashboard_provider.dart';
import 'package:crud/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DashboardProvider(context),
      child: _DashboardPage(navigationShell),
    );
  }
}

class _DashboardPage extends StatelessWidget {
  const _DashboardPage(this.navigationShell);

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BackButtonListener(
      onBackButtonPressed: () {
        if (navigationShell.currentIndex != 0) {
          _onBottomNavBarItemTap(context, 0);
          return Future.value(true);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          // type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  Assets.icons.home,
                  height: 24,
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  Assets.icons.home,
                  height: 24,
                  colorFilter: const ColorFilter.mode(AppColors.primaryMedium, BlendMode.srcIn),
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    Assets.icons.writeArticle,
                    height: 24,
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    Assets.icons.writeArticle,
                    height: 24,
                    colorFilter: const ColorFilter.mode(AppColors.primaryMedium, BlendMode.srcIn),
                  ),
                ),
                label: 'Write Article'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    Assets.icons.manageArticle,
                    height: 24,
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    Assets.icons.manageArticle,
                    height: 24,
                    colorFilter: const ColorFilter.mode(AppColors.primaryMedium, BlendMode.srcIn),
                  ),
                ),
                label: 'Manage Articles'),
          ],
          currentIndex: navigationShell.currentIndex,
          onTap: (int index) => _onBottomNavBarItemTap(context, index),
        ),
      ),
    );
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _onBottomNavBarItemTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
