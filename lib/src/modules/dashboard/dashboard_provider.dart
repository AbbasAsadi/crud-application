import 'package:crud/src/core/provider/safe_provider.dart';
import 'package:crud/src/helper/date_extensions.dart';
import 'package:crud/src/modules/home/_model/entity/article_response.dart';

class DashboardProvider extends SafeProvider {
  DashboardProvider(super.context);

  List<ArticleResponse> yourArticles = [
    ArticleResponse.fromBody(
      "Aute tongue consequat qui, et aliqua veniam ad fugiat irure pariatur porchetta ipsum andouille ribeye.  Swine sirloin in venison.  Nostrud porchetta chicken fatback, sed pork loin ullamco eu labore laboris adipisicing duis prosciutto.  Dolore landjaeger ut, filet mignon laborum ut pastrami.  Ex est tenderloin occaecat, alcatra ribeye nostrud.  Id sausage pork chop, alcatra do consequat ullamco nostrud bacon mollit beef ex laboris.  Jowl salami turkey pancetta, chicken sausage turducken velit ad pig tenderloin pastrami magna.",
      releaseDate: DateTime.now().formatDate,
      authorName: 'Abbas Asadi',
    )
  ];

  void addArticle(ArticleResponse article) {
    yourArticles.add(article);
    notifyListeners();
  }

  void onRemoveTapped(ArticleResponse value) {
    yourArticles.remove(value);
    notifyListeners();
  }

  void onEditTapped(ArticleResponse newValue, int index) {
    yourArticles.removeAt(index);
    notifyListeners();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        yourArticles.insert(index, newValue);
        notifyListeners();
      },
    );
  }
}
