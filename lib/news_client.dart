import 'package:dio/dio.dart';
import 'package:flutter_100_projects/constants.dart';
import 'package:flutter_100_projects/news.dart';
import 'package:retrofit/retrofit.dart';

part 'news_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class NewsClient {
  factory NewsClient(Dio dio, {String baseUrl}) = _NewsClient;

  @GET('/top-headlines')
  Future<News> getNews(
    @Query('country') String country,
    @Query('category') String category,
    @Query('apiKey') String apiKey,
  );
}
