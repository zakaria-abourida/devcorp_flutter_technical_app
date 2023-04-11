import 'package:devcorp_flutter_technical_test/controllers/article_controller.dart';
import 'package:devcorp_flutter_technical_test/widgets/articles/article_widget.dart';
import 'package:devcorp_flutter_technical_test/widgets/articles/text_field_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ArticlesListWidget extends StatelessWidget {
  ArticlesListWidget({
    super.key,
  });
  final ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFieldFormsEditProfileWidget(
              onChanged: (value) {
                articleController.searchArticle(value);
              },
              readOnly: false,
              hint: "Search",
              prefixIcon: const Icon(
                IconlyLight.search,
              )),
        ),
        Expanded(
          child: Obx(
            () => LazyLoadScrollView(
              onEndOfPage: () {
                articleController.onLoading();
             
              },
                // scrollOffset: 50 ,
              isLoading: articleController.isLoading.value,
              child: ListView.builder(
                itemCount: articleController.articlesSearch.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GetBuilder<ArticleController>(
                      builder: (controller) => ArticleWidget(
                        article: articleController.articlesSearch[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
