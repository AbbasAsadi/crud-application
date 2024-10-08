import 'package:crud/src/helper/context_extensions.dart';
import 'package:crud/src/helper/form_validator.dart';
import 'package:crud/src/modules/home/_model/entity/article_response.dart';
import 'package:crud/src/modules/manage_article/edit_article/edit_article_provider.dart';
import 'package:crud/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class EditArticlePage extends StatelessWidget {
  const EditArticlePage({super.key, required this.inputValue});

  final (ArticleResponse, int) inputValue;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EditArticleProvider(context, inputValue),
      child: const _EditArticlePage(),
    );
  }
}

class _EditArticlePage extends StatelessWidget {
  const _EditArticlePage();

  @override
  Widget build(BuildContext context) {
    var staticProvider = context.read<EditArticleProvider>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 56,
        title: Text(
          'Edit Your Article',
          style: context.textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: staticProvider.formKey,
          child: Column(
            children: [
              const Gap(60),
              TextFormField(
                controller: staticProvider.authorNameTextController,
                focusNode: staticProvider.authorNameFocusNode,
                validator: FormValidator.authorValidatorMethod,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLines: 2,
                minLines: 1,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => staticProvider.descriptionFocusNode.requestFocus,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  hintText: 'Author Name',
                ),
              ),
              const Gap(16),
              TextFormField(
                controller: staticProvider.descriptionTextController,
                focusNode: staticProvider.descriptionFocusNode,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLines: 20,
                minLines: 8,
                validator: FormValidator.descriptionValidatorMethod,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  hintText: 'Description',
                ),
              ),
              const Gap(40),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: staticProvider.editArticle,
                      style: ElevatedButton.styleFrom(
                          surfaceTintColor: AppColors.primaryMedium,
                          backgroundColor: AppColors.primaryMedium,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(16)),
                      child: Text(
                        'Edit',
                        style: context.textTheme.titleSmall?.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(32),
            ],
          ),
        ),
      ),
    );
  }
}
