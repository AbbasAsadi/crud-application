import 'package:crud/src/helper/random_data_generator.dart';
import 'package:crud/src/modules/article_detail/_model/entity/comment_model.dart';

class ArticleResponse {
  final String title;
  final String shortBody;
  final String fullBody;
  final String author;
  final String releasedDate;
  List<CommentModel> comments = [];

  ArticleResponse({
    required this.title,
    required this.shortBody,
    required this.fullBody,
    required this.author,
    required this.releasedDate,
  });

  static ArticleResponse fromBody(String item) {
    return ArticleResponse(
      title: item.split(' ').sublist(0, 3).join(' '),
      shortBody: '${item.split('.').sublist(0, 2).join('.')}.',
      fullBody: item,
      author: RandomDataGenerator.getRandomAuthorName(),
      releasedDate: RandomDataGenerator.getRandomReleaseDate(),
    );
  }
}
