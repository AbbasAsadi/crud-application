import 'package:crud/src/core/provider/safe_provider.dart';
import 'package:crud/src/helper/date_extensions.dart';
import 'package:crud/src/helper/random_data_generator.dart';
import 'package:crud/src/modules/article_detail/_model/entity/comment_model.dart';
import 'package:flutter/cupertino.dart';
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

  final FocusNode writeCommentFocusNode = FocusNode();
  final TextEditingController writeCommentTextController = TextEditingController();

  ArticleProvider(super.context);

  @override
  void dispose() {
    writeCommentFocusNode.dispose();
    writeCommentTextController.dispose();
    super.dispose();
  }

  void sendComment() {
    if (writeCommentTextController.text.isNotEmpty) {
      commentList.add(
        CommentModel(
          authorName: "You Wrote",
          createTime: DateTime.now().formatDate,
          body: writeCommentTextController.text,
        ),
      );
      writeCommentTextController.clear();
      writeCommentFocusNode.unfocus();
      notifyListeners();
    }
  }
}
