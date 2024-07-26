import 'package:crud/src/modules/home/_components/article_list_tile.dart';
import 'package:crud/src/modules/home/_model/entity/article_response.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeSuccessfulWidget extends StatelessWidget {
  const HomeSuccessfulWidget({super.key, this.data, required this.onRetryTapped, required this.onArticleTapped});

  final List<ArticleResponse>? data;
  final VoidCallback onRetryTapped;
  final ValueSetter<ArticleResponse> onArticleTapped;

  @override
  Widget build(BuildContext context) {
    if (data?.isNotEmpty ?? false) {
      return Expanded(
        child: ListView.separated(
          itemCount: data?.length ?? 0,
          separatorBuilder: (context, index) => const Gap(8),
          itemBuilder: (context, index) {
            return ArticleListTile(
              item: data![index],
              onTap: onArticleTapped,
            );
          },
        ),
      );
    } else {
      return Center(
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
      );
    }
  }
}
