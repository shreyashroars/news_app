import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NewsApp',
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(iconTheme: IconThemeData(color: Colors.black))
          //  primaryColor: Colors.black,
          ),
      home: SplashScreen(),
    );
  }
}
