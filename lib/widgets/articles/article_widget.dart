import 'package:devcorp_flutter_technical_test/models/article.dart';
import 'package:devcorp_flutter_technical_test/routes/routes.dart';
import 'package:devcorp_flutter_technical_test/widgets/articles/icon_cercle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;
  const ArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.detail, arguments: {
 'article': article,
});
      },
      child: Container(
        // padding: EdgeInsets.all(8),
        height: 400.w,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
                offset: Offset(0, 0),
                blurRadius: 15)
          ],
          color: Color.fromRGBO(251, 251, 251, 1),
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
                          offset: Offset(0, 0),
                          blurRadius: 15)
                    ],
                    color: Color(0XFF974896),
                  ),
                  child: ClipRRect(
                     borderRadius: const  BorderRadius.only(
                topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
            ),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                          color:const Color(0XFF974896),
                        ),
                      ),
                      errorWidget: (context, url, error) {
                        return const Center(
                          child: Icon(
                            Icons.error,
                            // color: Colors.red,
                          ),
                        );
                      },
                      imageUrl: article.urlToImage??'',
                    ),
                  ),
                )),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.15000000596046448),
                      offset: Offset(0, 0),
                      blurRadius: 15)
                ],
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                    const  Padding(
                        padding:  EdgeInsets.only( right : 8.0),
                        child:      Icon(
                IconlyLight.arrow_right_2,
                color:  Color(0XFF974896),
              ),
                      ),
              
                          Expanded(
                            child: Text(
                              article.title!,
                              style: TextStyle(
                                  fontSize: 19.sp,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconCercleWidgt(icon: IconlyLight.profile, size: 55.w),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.author!,
                                                                    overflow: TextOverflow.ellipsis,

                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  DateFormat('dd/MM/yyyy hh:mm').format(
                                      article.publishedAt ?? DateTime.now()),
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey.shade500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
