import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app/models/article.dart';

import '../news.dart';
import '../widgets/blogtile.dart';

class CategoryScreen extends StatefulWidget {
  String? category;
  CategoryScreen(this.category);
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool _loading = true;
  List<ArticleModel> article = [];
  @override
  void initState() {
    super.initState();
    getCatNews();
  }

  getCatNews() async {
    CategoryNews news = CategoryNews();
    await news.getNews(widget.category!);
    article = news.articles;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Turbo', style: TextStyle(color: Colors.black)),
            Text(
              'News',
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Icon(
                  Icons.share,
                )),
          )
        ],
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: _loading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Container(
                  child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: article.length,
                      itemBuilder: (context, index) => BlogTile(
                          url: article[index].link,
                          title: article[index].title,
                          img: article[index].imgurl,
                          description: article[index].description),
                    ),
                  ),
                ],
              )),
            ),
    );
  }
}
