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
      create: (_) => DashboardProvider(context, navigationShell),
      child: const _DashboardPage(),
    );
  }
}

class _DashboardPage extends StatelessWidget {
  const _DashboardPage();

  @override
  Widget build(BuildContext context) {
    var staticProvider = context.read<DashboardProvider>();

    return BackButtonListener(
      onBackButtonPressed: () {
        if (staticProvider.navigationShell.currentIndex != 0) {
          staticProvider.onBottomNavBarItemTap(0, staticProvider.navigationShell);
          return Future.value(true);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        body: staticProvider.navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
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
          currentIndex: staticProvider.navigationShell.currentIndex,
          onTap: (int index) => staticProvider.onBottomNavBarItemTap(index, staticProvider.navigationShell),
        ),
      ),
    );
  }
}
