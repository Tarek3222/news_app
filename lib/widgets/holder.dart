// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:news_app/models/articals_model.dart';
// import 'package:news_app/services/news_service.dart';
// import 'package:news_app/widgets/news_tile.dart';

// class NewsListViews extends StatefulWidget {
//   const NewsListViews({
//     super.key,
//   });

//   @override
//   State<NewsListViews> createState() => _NewsListViewsState();
// }

// class _NewsListViewsState extends State<NewsListViews> {

//   List<ArticalModel>articals=[];
//   bool isLoading=true;
//   @override
//   void initState()  {
//     super.initState();
//     grtGeneralNews();
//   }

//   Future<void> grtGeneralNews() async {
//     articals= await NewsService(Dio()).getGeneralNews(); 
//     isLoading=false;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading?const SliverFillRemaining(child:Center(child: CircularProgressIndicator())):
//      SliverList(
//       delegate: SliverChildBuilderDelegate(
//           childCount:articals.length,
//           (context, index) =>  Padding(
//                 padding: const EdgeInsets.only(bottom: 22),
//                 child:NewsTile(artical: articals[index],),
//               )
//               ),
//     );
//   }
// }
