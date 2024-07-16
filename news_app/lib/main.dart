import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id:(context) => const HomeScreen(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}