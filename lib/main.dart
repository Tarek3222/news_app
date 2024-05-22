import 'package:flutter/material.dart';
import 'package:news_app/views/log_in_view.dart';

void main() {
  runApp(const NewsApp());

}


class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const LogInView(),
    );
  }
}
