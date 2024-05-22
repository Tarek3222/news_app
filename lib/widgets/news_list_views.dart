import 'package:flutter/material.dart';
import 'package:news_app/models/articals_model.dart';
import 'package:news_app/widgets/news_tile.dart';


class NewsListViews extends StatelessWidget {

 final List<ArticalModel>articals;

  const NewsListViews({super.key, required this.articals});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          childCount:articals.length,
          (context, index) =>  Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child:NewsTile(artical: articals[index],),
              )
              ),
    );
  }
}
