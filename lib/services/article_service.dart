

import 'package:dio/dio.dart';

final dio = Dio();

class ArticleApi {
  String apiUrl = "https://newsapi.org/v2/everything";

  Future<Response> getArticles(String page) async {
    // var headers = {'Accept': 'application/json'};

    return dio.get(apiUrl, queryParameters: {

     'domains':'wsj.com',
      'apiKey': '1e2f8182b3ff4811a9f725b8fbdce219',
      'page': page
    
    });
  }


}
