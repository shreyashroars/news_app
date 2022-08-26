import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/article_screen.dart';

class BlogTile extends StatelessWidget {
  final String? img;
  final String? title;
  final String? description;
  final String? url;
  BlogTile(
      {required this.title,
      required this.img,
      required this.description,
      required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleScreen(
                      blogUrl: url,
                    )));
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        child: Column(children: [
          Text(
            title!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            width: double.infinity,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: img!,
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            description!,
            softWrap: true,
            overflow: TextOverflow.visible,
            style: TextStyle(color: Color.fromARGB(255, 119, 118, 118)),
          ),
        ]),
      ),
    );
  }
}
