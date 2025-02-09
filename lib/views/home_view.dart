import 'package:flutter/material.dart';
import 'package:news_app/widgets/categories_list_view.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'News',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  letterSpacing: 2,
                ),
              ),
              TextSpan(
                text: 'App',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  letterSpacing: 2,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoriesListView()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 15,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                'General',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 15,
              ),
            ),
            NewsListViewBuilder(
              category: 'general',
            ),
          ],
        ),
      ),
    );
  }
}
