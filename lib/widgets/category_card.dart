import 'package:flutter/material.dart';
import 'package:news_app/models/category_card_model.dart';
import 'package:news_app/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final CategoryCardModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(
                category: category.categoryName,
              );
            },
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 16),
        height: 115,
        width: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(category.image),
            fit: BoxFit.fill,
          ),
        ),
        child: Text(
          category.categoryName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ),
    );
  }
}
