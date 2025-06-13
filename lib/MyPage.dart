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
  final secondHlColr = Color.fromRGBO(62, 60, 58, 0.5);

  final bool _pinned = false;
  final bool _snap = false;
  final bool _floating = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 100,
      //   centerTitle: false,
      //   actions: [
      //     IconButton(onPressed: () {
      //       debugPrint('menu clicked.');
      //     },
      //     icon: Icon(Icons.apps_outlined)
      //     ),
      //   ],
      //   elevation: 0,
      //   title: Container(
      //     // color: secondColr,
      //     padding: EdgeInsets.all(5.0),
      //     width: 150,
      //     child: Text(
      //       'ABCD\nEFGHIJK',
      //       textAlign: TextAlign.justify,
      //       style: GoogleFonts.inconsolata(
      //         fontSize: 28,
      //         color: secondColr,
      //         fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //   ),
      // ),
      
      body: CustomScrollView(
        slivers : <Widget>[
          
          SliverAppBar(

            floating: _floating,
            snap: _snap,
            pinned: _pinned,

            centerTitle: false,
            expandedHeight: 100,
            collapsedHeight: 70,

            backgroundColor: secondColr,
            
            actions: [

              Container(
                // color: secondHlColr,
                margin: EdgeInsets.only(top: 0, right: 30),
                height: 80,
                width: 60,
                child: InkWell(
                  
                  radius: 10,
                  borderRadius: BorderRadius.all(Radius.circular(800)),
                
                  highlightColor: secondHlColr,
                
                  child: IconButton(
                    padding: EdgeInsets.all(4),
                    onPressed: () {
                      debugPrint('refresh');
                    },
                    icon: Icon(Icons.refresh_rounded),
                    splashRadius: 8,
                  
                    iconSize: 26,
                  
                    highlightColor: secondHlColr,
                    color: primaryColr,
                  ),
                ),
              ),

            ],
          
            flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  // color: secondColr,
                  padding: EdgeInsets.all(5.0),
                  width: 140,
                  
                  child: Text(
                    'ABCD\nEFGHIJK',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inconsolata(
                      fontSize: 20,
                      color: primaryColr,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

              // background: FlutterLogo(),

            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(child: Text('Scroll to see the SliverAppBar in effect.')),
              ),
            ),

          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                color: index.isOdd ? Colors.white : Colors.black12,
                height: 100.0,
                child: Center(child: Text('$index', textScaler: const TextScaler.linear(5))),
              );
            }, childCount: 20),
          ),

        ]
      ),

    bottomNavigationBar: Container(
      color: secondColr,
      height: 86,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6,
        children: [
          Container(
            // color: secondHlColr,
      
            margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
            padding: EdgeInsets.all(8),

            width: 160,

            child: Text(
              'Designed by\nHikariJadeEmpire',
              textAlign: TextAlign.justify,
              style: GoogleFonts.inconsolata(
                fontSize: 16,
                color: primaryColr,
                fontWeight: FontWeight.bold,
                ),
              ),
      
          ),
        ],
      ),
    ),

    );
  }
}