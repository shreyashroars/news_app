import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 6),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/29447-global-mobile-news-network.json',
                height: 250),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Turbo',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 29,
                      fontWeight: FontWeight.bold)),
              Text(
                'News',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 29,
                    fontWeight: FontWeight.bold),
              )
            ])
          ],
        ),
      ),
    );
  }
}
