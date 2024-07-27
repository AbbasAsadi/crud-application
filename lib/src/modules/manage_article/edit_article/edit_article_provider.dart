import 'package:crud/src/core/provider/safe_provider.dart';
import 'package:crud/src/helper/context_extensions.dart';
import 'package:crud/src/modules/dashboard/dashboard_provider.dart';
import 'package:crud/src/modules/home/_model/entity/article_response.dart';
import 'package:crud/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EditArticleProvider extends SafeProvider {
  EditArticleProvider(super.context, this.inputValue) {
    authorNameTextController.text = inputValue.$1.author;
    descriptionTextController.text = inputValue.$1.fullBody;
  }

  final (ArticleResponse, int) inputValue;
  final formKey = GlobalKey<FormState>();

  final TextEditingController authorNameTextController = TextEditingController();
  final TextEditingController descriptionTextController = TextEditingController();
  final FocusNode authorNameFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();

  @override
  void dispose() {
    authorNameFocusNode.dispose();
    authorNameTextController.dispose();
    descriptionTextController.dispose();
    descriptionFocusNode.dispose();
    super.dispose();
  }

  void editArticle() {
    if (formKey.currentState?.validate() ?? false) {
      context.read<DashboardProvider>().onEditTapped(
            ArticleResponse.fromBody(
              descriptionTextController.text,
              authorName: authorNameTextController.text,
              releaseDate: inputValue.$1.releasedDate,
            ),
            inputValue.$2,
          );

      authorNameFocusNode.unfocus();
      descriptionFocusNode.unfocus();

      context.read<DashboardProvider>().yourArticles;
      context.scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(
            'Your article edited successfully.',
            style: context.textTheme.bodyMedium?.copyWith(color: AppColors.white),
          ),
          backgroundColor: AppColors.successGreen,
        ),
      );
      context.pop();
    }
  }
}
