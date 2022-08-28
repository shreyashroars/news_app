import 'dart:convert';

import 'package:news_app/models/article.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> articles = [];
  Future<void> getNews() async {
    var Url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=230cd17d6c404e15b798b9cd9c19c3c7');
    var response = await http.get(Url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articlemodel = ArticleModel(
            title: element['title'],
            description: element['description'],
            imgurl: element['urlToImage'],
            content: element['context'],
            link: element['url'],
          );
          articles.add(articlemodel);
        }
      });
    }
  }
}

class CategoryNews {
  List<ArticleModel> articles = [];
  Future<void> getNews(String category) async {
    var Url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=230cd17d6c404e15b798b9cd9c19c3c7');
    var response = await http.get(Url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articlemodel = ArticleModel(
            title: element['title'],
            description: element['description'],
            imgurl: element['urlToImage'],
            content: element['context'],
            link: element['url'],
          );
          articles.add(articlemodel);
        }
      });
    }
  }
}
