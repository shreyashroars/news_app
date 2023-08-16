import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:news_app/models/article.dart';
import 'package:news_app/secrets.dart';

class News {
  List<ArticleModel> articles = [];
  Future<void> getNews() async {
    var Url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=${Secret.apiKey}');
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
        'https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=${Secret.apiKey}');
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
