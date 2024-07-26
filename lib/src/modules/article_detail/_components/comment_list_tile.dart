import 'package:crud/gen/assets.gen.dart';
import 'package:crud/src/helper/context_extensions.dart';
import 'package:crud/src/modules/article_detail/_model/entity/comment_model.dart';
import 'package:crud/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CommentListTile extends StatelessWidget {
  const CommentListTile({super.key, required this.commentModel});

  final CommentModel commentModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          Assets.icons.userCircle,
        ),
        const Gap(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(8),
            SizedBox(
              width: context.width * .80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    commentModel.authorName,
                    style: context.textTheme.labelSmall,
                  ),
                  Text(
                    commentModel.createTime,
                    style: context.textTheme.bodySmall?.copyWith(color: AppColors.gray50),
                  ),
                ],
              ),
            ),
            const Gap(8),
            Text(
              commentModel.body,
              style: context.textTheme.bodyMedium?.copyWith(color: AppColors.gray800),
            ),
            const Gap(8),
            IconButton(
              onPressed: () {

              },
              icon: Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.reply,
                    color: AppColors.primaryMedium,
                  ),
                  const Gap(8),
                  Text(
                    'Reply',
                    style: context.textTheme.bodyMedium?.copyWith(color: AppColors.primaryMedium),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
