import 'package:crud/src/core/provider/safe_provider.dart';
import 'package:crud/src/helper/context_extensions.dart';
import 'package:crud/src/helper/date_extensions.dart';
import 'package:crud/src/modules/dashboard/dashboard_provider.dart';
import 'package:crud/src/modules/home/_model/entity/article_response.dart';
import 'package:crud/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WriteArticleProvider extends SafeProvider {
  WriteArticleProvider(super.context);

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

  void submitArticle() {
    if (formKey.currentState?.validate() ?? false) {
      context.read<DashboardProvider>().addArticle(
            ArticleResponse.fromBody(
              descriptionTextController.text,
              authorName: authorNameTextController.text,
              releaseDate: DateTime.now().formatDate,
            ),
          );
      authorNameTextController.clear();
      authorNameFocusNode.unfocus();
      descriptionTextController.clear();
      descriptionFocusNode.unfocus();

      context.scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(
            'Your article published successfully.',
            style: context.textTheme.bodyMedium?.copyWith(color: AppColors.white),
          ),
          backgroundColor: AppColors.successGreen,
        ),
      );

    }
  }

  String? authorValidatorMethod(String? inputValue) {
    if (inputValue?.isNotEmpty ?? false) {
      return null;
    } else {
      return "This Field Is Empty";
    }
  }

  String? descriptionValidatorMethod(String? inputValue) {
    if (inputValue?.isNotEmpty ?? false) {
      String formattedValue = inputValue!.trim();
      if (formattedValue.split(' ').length > 3) {
        if (formattedValue.split('.').length > 2) {
          return null;
        } else {
          return 'Should be at least 2 sentence.';
        }
      } else {
        return 'Should be at least 3 words.';
      }
    } else {
      return "This Field Is Empty";
    }
  }
}
