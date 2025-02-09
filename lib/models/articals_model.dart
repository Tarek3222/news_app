class ArticalModel {
  final String? image;
  final String title;
  final String? subTitle;
  final String url;

  const ArticalModel(
      {required this.url,
      required this.image,
      required this.title,
      required this.subTitle});

  factory ArticalModel.fromJson(json) {
    return ArticalModel(
      url: json['url'],
      image: json['urlToImage'],
      title: json['title'],
      subTitle: json['description'],
    );
  }
}
