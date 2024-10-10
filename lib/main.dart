import 'package:flutter/material.dart';
import 'package:webtoon_explorer/HomeScreen.dart';

void main() {
  runApp(WebtoonExplorerApp());
}

class WebtoonExplorerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webtoon Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
