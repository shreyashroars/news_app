import 'package:flutter/material.dart';
import 'package:news_app/categ_data.dart';
import 'package:news_app/widgets/category_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Turbo', style: TextStyle(color: Colors.black)),
            Text(
              'News',
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: Column(children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: dummyCategories
                .map((c) => CategoryItem(c.categ_name, c.cat_img))
                .toList(),
          ),
        ),
      ]),
    );
  }
}
