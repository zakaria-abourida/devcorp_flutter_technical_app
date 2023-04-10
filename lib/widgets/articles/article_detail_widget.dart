import 'package:cached_network_image/cached_network_image.dart';
import 'package:devcorp_flutter_technical_test/models/article.dart';
import 'package:devcorp_flutter_technical_test/widgets/articles/icon_cercle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

class ArticleDetailWidegt extends StatelessWidget {
  final Article article;
  const ArticleDetailWidegt({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        //2
        SliverAppBar(
          backgroundColor: const Color(0XFF974896),
          expandedHeight: 250.0,
          floating: true,
          pinned: true,
          snap: true,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Transform(
              // you can forcefully translate values left side using Transform
              transform: Matrix4.translationValues(-30.0, 0.0, 0.0),
              child: Text(
                article.title ?? '',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            centerTitle: false,
            background: CachedNetworkImage(
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                  color: const Color(0XFF974896),
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
              imageUrl: article.urlToImage ?? '',
            ),
          ),
        ),
        //3
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
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
                                  fontSize: 17.sp, fontWeight: FontWeight.w600),
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
              ),
              const Divider(thickness: 1, indent: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  // height: 20,
                  child: Text(
                    article.content ?? '',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
