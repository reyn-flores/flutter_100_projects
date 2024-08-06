import 'package:dio/dio.dart';
import 'package:flutter_100_projects/constants.dart';
import 'package:flutter_100_projects/news.dart';

class NewsClient {
  NewsClient({required this.dio});

  final Dio dio;

  Future<List<Article>> getNews() async {
    final response = await dio.get(
      '/top-headlines',
      queryParameters: {
        'country': 'us',
        'category': 'business',
        'apiKey': defaultApiKey,
      },
    );

    News news = News.fromJson(response.data);
    return news.articles;
  }
}
