import 'package:crud/src/helper/context_extensions.dart';
import 'package:crud/src/modules/dashboard/dashboard_provider.dart';
import 'package:crud/src/modules/home/_model/entity/article_response.dart';
import 'package:crud/src/modules/manage_article/_components/my_article_list_tile.dart';
import 'package:crud/src/modules/manage_article/manage_article_provider.dart';
import 'package:crud/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ManageArticlePage extends StatelessWidget {
  const ManageArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ManageArticleProvider(context),
      child: const _ManageArticlePage(),
    );
  }
}

class _ManageArticlePage extends StatelessWidget {
  const _ManageArticlePage();

  @override
  Widget build(BuildContext context) {
    var staticProvider = context.read<ManageArticleProvider>();
    List<ArticleResponse> yourArticleList = context.read<DashboardProvider>().yourArticles;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 56,
        title: Text(
          'Manage Your Article',
          style: context.textTheme.headlineMedium,
        ),
      ),
      body: Selector<DashboardProvider, int>(
        selector: (_, provider) => provider.yourArticles.length,
        builder: (_, length, __) {
          if (length > 0) {
            return ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: yourArticleList.length,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const Gap(8),
              itemBuilder: (context, index) {
                return MyArticleListTile(
                  index: index,
                  item: yourArticleList[index],
                  onItemTapped: staticProvider.onArticleTapped,
                  onEditItemTapped: staticProvider.onEditTapped,
                  onDeleteItemTapped: staticProvider.onRemoveTapped,
                );
              },
            );
          } else {
            return Center(
              child: Text(
                "You don't have any article yet!",
                style: context.textTheme.headlineSmall?.copyWith(color: AppColors.gray50),
              ),
            );
          }
        },
      ),
    );
  }
}
