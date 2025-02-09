import 'package:dio/dio.dart';
import 'package:news_app/models/articals_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticalModel>> getTopHeadlines({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=3e7c9e2876fc4a8d85e7846756622396');

      //Data from Api
      Map<String, dynamic> jsonData = response.data;
      //Articals
      List<dynamic> articles = jsonData["articles"];
      List<ArticalModel> articalsList = [];
      articalsList =
          articles.map((artical) => ArticalModel.fromJson(artical)).toList();

      return articalsList;
    } catch (e) {
      return [];
    }
  }
}
