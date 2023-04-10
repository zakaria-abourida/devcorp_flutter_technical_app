import 'package:devcorp_flutter_technical_test/models/article.dart';
import 'package:devcorp_flutter_technical_test/services/article_service.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class ArticleController extends GetxController {
  final articles = <Article>[].obs;
  final articlesSearch = <Article>[].obs;
  final _searchTerm = ''.obs;
  final _page = 1.obs;
  var len = 0.obs;
  var isLoading = false.obs;


  ArticleApi articleApi = ArticleApi();

  String get searchTerm => _searchTerm.value;
  int get page => _page.value;

  @override
  void onInit() async {
    await fetchArticles(reset: false);
    update();

    super.onInit();
  }

  void setSearchTerm(String term) {
    _searchTerm.value = term;
    fetchArticles(reset: true);
  }

  onLoading() {
    fetchArticles(reset: false);
  }

  void searchArticle(String enteredKeyword) {
    List<Article> results = [];
    if (enteredKeyword.isEmpty) {
      results = articles;
    } else {
      results = articles
          .where((user) =>
              user.title!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    articlesSearch.value = results;
    update();
  }

  Future<void> fetchArticles({bool reset = false}) async {
    if (reset) {
      _page.value = 1;
    }

    len.value++;

    dio.Response response;

   

    response = await articleApi.getArticles(_page.value.toString());

    switch (response.statusCode) {
      case 200:
        List<dynamic> result = response.data["articles"];

        for (int i = 0; i < result.length; i++) {
          articles.add(Article.fromJson(result[i]));
        }

        articlesSearch.value = articles;
                isLoading.value = false;

        update();
        break;

      case 401:
        isLoading.value = false;
        break;
      default:
    }

    _page.value += 1;
  }
}
