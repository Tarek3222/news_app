import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/articals_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/error_widget.dart';
import 'package:news_app/widgets/loading_indicator.dart';
import 'package:news_app/widgets/news_list_views.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key, required this.category,
  });
  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {

  // ignore: prefer_typing_uninitialized_variables
  var future;
  @override
  void initState() {
    super.initState();
    future=NewsService(Dio()).getTopHeadlines(
      category: widget.category,
    );
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticalModel>>(
        future: future ,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return NewsListViews(articals: snapShot.data!);
          } else if (snapShot.hasError) {
            return const SliverFillRemaining(
              child:ErrorMessege(messege: 'oops there was an error, try later'),
            );
          } else {
            return const SliverFillRemaining(
              child:  LoadingIndicator()
              );
          }
        },
        );
  }
}
