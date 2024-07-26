import 'package:crud/src/helper/random_data_generator.dart';

class ArticleResponse {
  final String title;
  final String shortBody;
  final String fullBody;
  final String author;
  final String releasedDate;

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
