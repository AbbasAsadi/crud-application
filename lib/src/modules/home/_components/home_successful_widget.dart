import 'package:crud/src/helper/context_extensions.dart';
import 'package:crud/src/modules/home/_components/article_list_tile.dart';
import 'package:crud/src/modules/home/_model/entity/article_response.dart';
import 'package:crud/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeSuccessfulWidget extends StatelessWidget {
  const HomeSuccessfulWidget(
      {super.key, this.data, required this.onRetryTapped, required this.onArticleTapped, required this.yourArticles});

  final List<ArticleResponse>? data;
  final List<ArticleResponse> yourArticles;
  final VoidCallback onRetryTapped;
  final ValueSetter<ArticleResponse> onArticleTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
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
                onTap: onArticleTapped,
              );
            },
          ),
        ],
        if (data?.isNotEmpty ?? false) ...[
          Text(
            'Last Articles',
            style: context.textTheme.titleLarge?.copyWith(color: AppColors.gray900),
          ),
          const Gap(16),
          ListView.separated(
            itemCount: data?.length ?? 0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const Gap(8),
            itemBuilder: (context, index) {
              return ArticleListTile(
                item: data![index],
                onTap: onArticleTapped,
              );
            },
          ),
        ],
        if (data?.isEmpty ?? true) ...[
          Center(
            child: Column(
              children: [
                const Text('No article found'),
                const Gap(16),
                OutlinedButton(
                  onPressed: onRetryTapped,
                  child: const Text('tryAgain'),
                ),
              ],
            ),
          )
        ],
      ],
    );
  }
}
