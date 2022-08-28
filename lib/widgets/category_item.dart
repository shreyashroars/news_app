import 'package:flutter/material.dart';
import 'package:news_app/screens/homepage.dart';

class CategoryItem extends StatelessWidget {
  final String categ_name;
  final String img;
  CategoryItem(this.categ_name, this.img);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.amberAccent,
      ),
      padding: EdgeInsets.all(4),
      child: Text(
        categ_name,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
