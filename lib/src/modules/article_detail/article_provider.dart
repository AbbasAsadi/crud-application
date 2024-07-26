import 'package:crud/src/core/provider/safe_provider.dart';
import 'package:crud/src/helper/date_extensions.dart';
import 'package:crud/src/helper/random_data_generator.dart';
import 'package:crud/src/modules/article_detail/_model/entity/comment_model.dart';
import 'package:flutter/material.dart';

class ArticleProvider extends SafeProvider {
  List<CommentModel> commentList = [
    CommentModel(
      authorName: RandomDataGenerator.getRandomAuthorName(),
      createTime: RandomDataGenerator.getRandomReleaseDate(),
      body: 'Thank you! that was very helpful!',
    ),
    CommentModel(
      authorName: RandomDataGenerator.getRandomAuthorName(),
      createTime: RandomDataGenerator.getRandomReleaseDate(),
      body: 'very useful',
    ),
  ];
  final TextEditingController commentTextController = TextEditingController();
  final FocusNode commentFocusNode = FocusNode();

  ArticleProvider(super.context);

  @override
  void dispose() {
    commentTextController.dispose();
    commentFocusNode.dispose();
    super.dispose();
  }

  void addItemToCommentList() {
    commentList.add(
      CommentModel(
        authorName: RandomDataGenerator.getRandomAuthorName(),
        createTime: DateTime.now().formatDate,
        body: commentTextController.text,
      ),
    );
    notifyListeners();
  }
}
