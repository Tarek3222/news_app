
import 'package:flutter/material.dart';
import 'package:news_app/widgets/categories_list_view.dart';
import 'package:news_app/widgets/drawer.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: const Drawer(
        width: 250,
        elevation: 0,
        child: DrawerWidget(),
      ),
      
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title:RichText(
          text:const TextSpan(
            children: [
              TextSpan(
                text: 'News', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              TextSpan(
                text: 'Cloud', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange, fontSize: 24),
              ),
            ]
          ) ,
          ),
      ),
      body: const Padding(
        padding:   EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
             SliverToBoxAdapter(child: CategoriesListView()),
              SliverToBoxAdapter(child: SizedBox(height: 30,)),
              NewsListViewBuilder(category: 'general',),    
          ],
        )
      )
    );
  }
}

