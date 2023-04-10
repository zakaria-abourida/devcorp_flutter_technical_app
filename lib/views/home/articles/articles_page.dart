import 'package:devcorp_flutter_technical_test/controllers/article_controller.dart';
import 'package:devcorp_flutter_technical_test/widgets/articles/appbar_widget.dart';
import 'package:devcorp_flutter_technical_test/widgets/articles/article_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  ArticlesPageState createState() => ArticlesPageState();
}

class ArticlesPageState extends State<ArticlesPage> {
  final ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "News"),
      body: articleController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ArticlesListWidget(),
    );
  }
}
