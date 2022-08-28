import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/category_news.dart';

class CategoryItem extends StatelessWidget {
  final String categ_name;
  final String img;
  CategoryItem(this.categ_name, this.img);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategoryScreen(categ_name.toLowerCase())));
      },
      child: Stack(children: [
        Container(
            margin: const EdgeInsets.all(4),
            height: 60,
            width: 120,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(imageUrl: img, fit: BoxFit.cover))),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black26,
          ),
          margin: EdgeInsets.all(4),
          height: 60,
          width: 120,
          child: Center(
            child: Text(
              categ_name,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        )
      ]),
    );
  }
}
