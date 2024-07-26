import 'package:crud/src/helper/context_extensions.dart';
import 'package:crud/src/modules/article_detail/_components/comment_list_tile.dart';
import 'package:crud/src/modules/article_detail/_components/empty_comment_state.dart';
import 'package:crud/src/modules/article_detail/_model/entity/comment_model.dart';
import 'package:crud/src/modules/article_detail/article_provider.dart';
import 'package:crud/src/modules/home/_model/entity/article_response.dart';
import 'package:crud/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key, required this.article});

  final ArticleResponse article;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ArticleProvider(context),
      child: _ArticlePage(article),
    );
  }
}

class _ArticlePage extends StatelessWidget {
  const _ArticlePage(this.article);

  final ArticleResponse article;

  @override
  Widget build(BuildContext context) {
    var staticProvider = context.read<ArticleProvider>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.gray50,
          ),
        ),
        title: Text(
          'Article',
          style: context.textTheme.bodyMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                article.title,
                style: context.textTheme.titleLarge?.copyWith(color: AppColors.gray900),
              ),
            ),
            const Gap(8),
            Row(
              children: [
                const Gap(16),
                Text(
                  article.author,
                  style: context.textTheme.bodyMedium?.copyWith(color: AppColors.gray50),
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
                  article.releasedDate,
                  style: context.textTheme.bodyMedium?.copyWith(color: AppColors.gray50),
                ),
                const Gap(16),
              ],
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                article.fullBody,
                textAlign: TextAlign.justify,
                style: context.textTheme.headlineMedium?.copyWith(color: AppColors.gray800),
              ),
            ),
            const Gap(40),
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                horizontal: BorderSide(color: AppColors.gray100),
              )),
              child: Text(
                'Comments',
                style: context.textTheme.labelSmall?.copyWith(color: AppColors.primaryMedium),
              ),
            ),
            const Gap(16),
            getCommentList(staticProvider.commentList),
            const Gap(32),
          ],
        ),
      ),
    );
  }

  Widget getCommentList(List<CommentModel> commentList) {
    if (commentList.isNotEmpty) {
      return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: commentList.length,
        separatorBuilder: (context, index) => const Gap(16),
        itemBuilder: (context, index) {
          return CommentListTile(
            commentModel: commentList[index],
          );
        },
      );
    } else {
      return const EmptyCommentState();
    }
  }
}
