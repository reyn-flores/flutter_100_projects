import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_100_projects/constants.dart';
import 'package:flutter_100_projects/news.dart';
import 'package:flutter_100_projects/news_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late NewsClient _client;
  late List<Article> news = [];

  @override
  void initState() {
    super.initState();
    _client = NewsClient(Dio());
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News with Retrofit'),
      ),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              width: 100,
              fit: BoxFit.fill,
              '${news[index].urlToImage}',
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade200,
                  width: 100,
                  child: const Center(
                    child: Icon(Icons.image),
                  ),
                );
              },
            ),
            dense: true,
            title: Text(news[index].title),
            subtitle: Text(
              '${news[index].author} - ${news[index].publishedAt}',
            ),
          );
        },
      ),
    );
  }

  Future<void> getNews() async {
    final response = await _client.getNews('us', 'politics', defaultApiKey);
    news.addAll(response.articles);
    setState(() {});
  }
}
