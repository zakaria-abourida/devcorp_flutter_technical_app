import 'package:devcorp_flutter_technical_test/models/article.dart';
import 'package:devcorp_flutter_technical_test/widgets/articles/article_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({super.key});

  @override
  Widget build(BuildContext context) {


      final  param = Get.arguments['article'] as Article  ;

    return  Scaffold(backgroundColor: Colors.white,  body: ArticleDetailWidegt(article: param),);
  }
}