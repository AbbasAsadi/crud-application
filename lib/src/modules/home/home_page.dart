import 'package:crud/gen/assets.gen.dart';
import 'package:crud/src/components/api_response_handler_widget.dart';
import 'package:crud/src/helper/context_extensions.dart';
import 'package:crud/src/models/base/api_request_status.dart';
import 'package:crud/src/modules/dashboard/dashboard_provider.dart';
import 'package:crud/src/modules/home/_components/article_list_tile.dart';
import 'package:crud/src/modules/home/_components/home_drawer.dart';
import 'package:crud/src/modules/home/_components/home_successful_widget.dart';
import 'package:crud/src/modules/home/_model/entity/article_response.dart';
import 'package:crud/src/modules/home/home_provider.dart';
import 'package:crud/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(context),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    var staticProvider = context.read<HomeProvider>();
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.icons.search),
          ),
          const Gap(8),
        ],
      ),
      drawerEnableOpenDragGesture: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(8),
            Selector<DashboardProvider, int>(
              selector: (_, provider) => provider.yourArticles.length,
              builder: (context, value, child) {
                List<ArticleResponse> yourArticles = context
                    .read<DashboardProvider>()
                    .yourArticles;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (yourArticles.isNotEmpty) ...[
                      Text(
                        'Your Articles',
                        style: context.textTheme.titleLarge?.copyWith(color: AppColors.gray900),
                      ),
                      const Gap(16),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: yourArticles.length,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => const Gap(8),
                        itemBuilder: (context, index) {
                          return ArticleListTile(
                            item: yourArticles[index],
                            onTap: staticProvider.onArticleTapped,
                          );
                        },
                      ),
                      const Gap(24),
                    ],
                  ],
                );
              },
            ),
            Selector<HomeProvider, ApiRequestStatus>(
              selector: (_, provider) => provider.homeResponse.status,
              builder: (_, status, __) {
                return ApiResponseHandlerWidget(
                  status: status,
                  customSuccessWidget: HomeSuccessfulWidget(
                    data: staticProvider.homeResponse.data,
                    onRetryTapped: staticProvider.initialize,
                    onArticleTapped: staticProvider.onArticleTapped,
                  ),
                  onRetryTapped: staticProvider.initialize,
                );
              },
            ),
            const Gap(32),
          ],
        ),
      ),
    );
  }
}
