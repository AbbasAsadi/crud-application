import 'package:crud/src/helper/context_extensions.dart';
import 'package:crud/src/modules/home/_model/entity/article_response.dart';
import 'package:crud/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyArticleListTile extends StatefulWidget {
  const MyArticleListTile({
    super.key,
    required this.item,
    required this.onItemTapped,
    required this.onDeleteItemTapped,
    required this.onEditItemTapped,
    required this.index,
  });

  final int index;
  final ArticleResponse item;
  final ValueSetter<ArticleResponse> onItemTapped;
  final ValueSetter<ArticleResponse> onDeleteItemTapped;
  final ValueSetter<(ArticleResponse, int)> onEditItemTapped;

  @override
  State<MyArticleListTile> createState() => _MyArticleListTileState();
}

class _MyArticleListTileState extends State<MyArticleListTile> {
  bool inEditMode = false;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => inEditMode ? null : widget.onItemTapped(widget.item),
      onLongPress: () {
        setState(() {
          inEditMode = !inEditMode;
        });
      },
      style: OutlinedButton.styleFrom(
        shadowColor: Colors.black.withOpacity(.08),
        padding: const EdgeInsets.all(16),
        surfaceTintColor: Colors.white,
        elevation: 5,
        side: BorderSide(
          color: AppColors.primaryMedium.withOpacity(.14),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.item.title,
            style: context.textTheme.titleSmall?.copyWith(color: AppColors.gray900),
          ),
          const Gap(4),
          Row(
            children: [
              Text(
                widget.item.author,
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
                widget.item.releasedDate,
                style: context.textTheme.bodySmall?.copyWith(color: AppColors.gray50),
              ),
             if(inEditMode) ...[
               const Spacer(),
               IconButton(
                 onPressed: () => widget.onEditItemTapped((widget.item, widget.index)),
                 icon: const Icon(Icons.edit_outlined),
               ),
               const Gap(8),
               IconButton(
                 onPressed: () => widget.onDeleteItemTapped(widget.item),
                 icon: const Icon(Icons.delete_outline_rounded),
               ),
             ]
            ],
          ),
          if(!inEditMode)
          const Gap(12),
          Text(
            widget.item.shortBody,
            textAlign: TextAlign.justify,
            style: context.textTheme.bodyMedium?.copyWith(color: AppColors.gray800),
          ),
        ],
      ),
    );
  }
}
