import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class MyWeatherApp extends StatefulWidget {
  const MyWeatherApp({super.key});

  @override
  State<MyWeatherApp> createState() {
    return _MyWeatherApp();
  }
}

class _MyWeatherApp extends State<MyWeatherApp> {
  final primaryColr = Color.fromRGBO(251, 238, 230, 1);
  final secondColr = Color.fromRGBO(29, 27, 26, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {
            debugPrint('menu clicked.');
          },
          icon: Icon(Icons.apps_outlined)
          ),
        ],
        elevation: 0,
        title: Container(
          // color: secondColr,
          padding: EdgeInsets.all(5.0),
          width: 150,
          child: Text(
            'ABCD\nEFGHIJK',
            textAlign: TextAlign.justify,
            style: GoogleFonts.inconsolata(
              fontSize: 28,
              color: secondColr,
              fontWeight: FontWeight.bold,
              ),
            ),
        ),
      ),
      body: Placeholder(),
    );
  }
}