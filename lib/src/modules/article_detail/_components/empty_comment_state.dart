import 'package:crud/src/helper/context_extensions.dart';
import 'package:crud/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyCommentState extends StatelessWidget {
  const EmptyCommentState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "You don't have any comment yet!",
        style: context.textTheme.headlineSmall?.copyWith(color: AppColors.gray50),
      ),
    );
  }
}
