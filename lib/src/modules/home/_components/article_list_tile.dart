import 'package:crud/src/helper/context_extensions.dart';
import 'package:crud/src/modules/home/_model/entity/article_response.dart';
import 'package:crud/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ArticleListTile extends StatelessWidget {
  const ArticleListTile({super.key, required this.item});

  final ArticleResponse item;

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      shadowColor: Colors.black.withOpacity(.08),
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), side: BorderSide(color: AppColors.primaryMedium.withOpacity(.14))),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: context.textTheme.titleSmall?.copyWith(color: AppColors.gray900),
            ),
            const Gap(4),
            Row(
              children: [
                Text(
                  item.author,
                  style: context.textTheme.bodySmall?.copyWith(color: AppColors.gray50),
                ),
                const Gap(8),
                Container(
                  height: 4,
                  width: 4,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryMedium,
                  ),
                ),
                const Gap(8),
                Text(
                  item.releasedDate,
                  style: context.textTheme.bodySmall?.copyWith(color: AppColors.gray50),
                ),
              ],
            ),
            const Gap(12),
            Text(
              item.shortBody,
              textAlign: TextAlign.justify,
              style: context.textTheme.bodyMedium?.copyWith(color: AppColors.gray800),
            ),
          ],
        ),
      ),
    );
  }
}
