import 'package:carousel_slider/carousel_slider.dart';
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
  final primaryColr = Color.fromRGBO(255, 255, 255, 1);
  final secondColr = Color.fromRGBO(19, 19, 20, 1);
  final secondHlColr = Color.fromRGBO(121, 121, 121, 0.5);

  final limeColr = Color.fromRGBO(218, 240, 89, 1);
  final blueColr = Color.fromRGBO(47, 49, 245, 1);
  final lightBlueColr = Color.fromRGBO(0, 166, 192, 1);
  final platinumColr = Color.fromRGBO(235, 235, 233, 1);

  final bool _pinned = false;
  final bool _snap = false;
  final bool _floating = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: secondColr,

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
                    'WEATHER\nOBSERVATION',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inconsolata(
                      fontSize: 19,
                      color: primaryColr,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

              // background: FlutterLogo(),

            ),
          ),

          ////////////////////////////
          ////// START Widgets HERE !!
          ////////////////////////////

          SliverToBoxAdapter(
              child: Column(
                children: [
                  
                  Container(
                    color: secondColr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                    
                      children: [
                    
                        Container(
                          // color: secondColr,
                          padding: EdgeInsets.all(5.0),
                          width: 140,
                          
                          child: Text(
                            '// Today\'s\nTemperatures',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.inconsolata(
                              fontSize: 18,
                              color: primaryColr,
                              fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                    
                        SizedBox(
                          height: 90,
                          width: 160,
                          child: Placeholder(),
                        ),
                    
                      ],
                    
                    ),
                  ),

                  Container(
                    height: 260,
                    margin: EdgeInsets.all(5),

                    child: CarouselSlider(
                        items: [

                          Container(
                            margin: EdgeInsets.all(10),
                            color: limeColr,
                          ),

                          Container(
                            margin: EdgeInsets.all(10),
                            color: blueColr,
                          ),

                          Container(
                            margin: EdgeInsets.all(10),
                            color: lightBlueColr,
                          ),

                        ],
                      
                      //Slider Container properties
                      options: CarouselOptions(
                        height: 250.0,

                        enlargeCenterPage: true,
                        enlargeFactor: 0.1,
                        viewportFraction: 0.94,
                        // aspectRatio: 3.5 / 2,

                        autoPlay: true,
                        autoPlayCurve: Curves.easeInOut,
                        autoPlayInterval: Duration(seconds: 4),

                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 900),

                      ),
                    ),
                  ),

                Container(
                    color: secondColr,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                    
                      children: [
                    
                        Container(
                          // color: secondColr,
                          padding: EdgeInsets.all(5.0),
                          width: 140,
                          
                          child: Text(
                            '// Additional\nInformations',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.inconsolata(
                              fontSize: 18,
                              color: primaryColr,
                              fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                    
                        SizedBox(
                          height: 90,
                          width: 160,
                          child: Placeholder(),
                        ),
                    
                      ],
                    
                    ),
                  ),

                 // To Place

                ],
              )
            )

          // The code below is just an examples
          // SliverList(
          //   delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          //     return Container(
          //       color: index.isOdd ? Colors.white : Colors.black12,
          //       height: 100.0,
          //       child: Center(child: Text('$index', textScaler: const TextScaler.linear(5))),
          //     );
          //   }, childCount: 20),
          // ),

        ]
      ),

    bottomNavigationBar: Container(
      color: primaryColr,
      height: 360,
      child: Column(
        children: [

          Container(
            height: 260,
            // width: 370,

            color: primaryColr,
            // child: Placeholder(),
            ),

          Row(
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
                    color: secondColr,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
          
              ),
            ],
          ),
        ],
      ),
    ),

    );
  }
}
