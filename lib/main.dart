import 'package:flutter/material.dart';
import 'MyPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // BuildContext is to tell the Flutter how widget tree is structed

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWeatherApp(),
    );
  }
}