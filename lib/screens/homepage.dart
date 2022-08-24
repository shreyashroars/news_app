import 'package:flutter/material.dart';

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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.amberAccent,
                ),
                padding: EdgeInsets.all(4),
                child: Text(
                  'Business',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amberAccent,
                  ),
                  padding: EdgeInsets.all(4),
                  child: Text('Sports',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              SizedBox(
                width: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amberAccent,
                  ),
                  padding: EdgeInsets.all(4),
                  child: Text('Politics',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              SizedBox(
                width: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amberAccent,
                  ),
                  padding: EdgeInsets.all(4),
                  child: Text('Entertainment',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              SizedBox(
                width: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amberAccent,
                  ),
                  padding: EdgeInsets.all(4),
                  child: Text('Education',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(),
        )
      ]),
    );
  }
}
