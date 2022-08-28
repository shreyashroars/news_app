import 'package:flutter/material.dart';
import 'package:news_app/categ_data.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/widgets/blogtile.dart';
import 'package:news_app/widgets/category_item.dart';

import '../news.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: deprecated_member_use
  late List<ArticleModel> article;
  bool _loading = true;
  @override
  void initState() {
    super.initState;
    getNews();
  }

  getNews() async {
    News news = News();
    await news.getNews();
    article = news.articles;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 6,
        centerTitle: true,
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
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _loading
          ? Container(
              child: const Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: dummyCategories
                            .map((c) => CategoryItem(c.categ_name, c.cat_img))
                            .toList(),
                      ),
                    ),
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
                ),
              ),
            ),
    );
  }
}
