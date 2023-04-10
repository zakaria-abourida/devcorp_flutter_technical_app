import 'package:devcorp_flutter_technical_test/views/home/article_detail_page.dart';
import 'package:devcorp_flutter_technical_test/views/home/articles/articles_page.dart';
import 'package:get/get.dart';


class Routes {
  static const home = '/';
  static const detail = '/detail';

  static List<GetPage<dynamic>>? getPages = [
    GetPage(name: home, page: () => const ArticlesPage()),
     GetPage(
          name: detail,
          page: () => const ArticleDetailPage(),
          transition: Transition.rightToLeft,
        ),
  ];
}
