import 'package:flutter/material.dart';
import 'package:news_app/models/category_card_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  final List<CategoryCardModel> categories = const [
    CategoryCardModel(image: 'assets/business2.jpg', categoryName: 'Business'),
    CategoryCardModel(
        image: 'assets/entertaiment.avif', categoryName: 'Entertainment'),
    CategoryCardModel(image: 'assets/health.avif', categoryName: 'Health'),
    CategoryCardModel(image: 'assets/science2.jpg', categoryName: 'Science'),
    CategoryCardModel(image: 'assets/sports2.jpg', categoryName: 'Sports'),
    CategoryCardModel(
        image: 'assets/technology2.jpg', categoryName: 'Technology'),
    CategoryCardModel(image: 'assets/general.avif', categoryName: 'General'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(category: categories[index]);
          }),
    );
  }
}
