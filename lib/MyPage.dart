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
                    // color: secondHlColr,
                    margin: EdgeInsets.all(6.0),
                    height: 40,
                    
                    child: Text(
                      'LOCATION : Bangkok, Thailand',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.inconsolata(
                        fontSize: 16,
                        color: primaryColr,
                        fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  
                  Container(
                    color: secondColr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 18,
                    
                      children: [
                    
                        Container(
                          // color: secondHlColr,
                          padding: EdgeInsets.all(10.0),
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
                        
                        Container(
                            width: 3,
                            height: 80,
                            color: secondHlColr,
                          ),

                        NumItem(
                          colr: primaryColr, 
                          textLabel: 'CELCIUS', 
                          stringNum: '31',
                          ),
                        
                        Column(
                          children: [
                        
                            Image.asset(
                              'images/waterfall.gif',
                              height: 45,
                            ),
                        
                            Container(
                              height: 40,
                              width: 80,
                              padding: EdgeInsets.all(8),
                              color: secondHlColr,
                              child: Text(
                              'Sunny',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inconsolata(
                                fontSize: 16,
                                color: primaryColr,
                                fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                        
                          ],
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
                    
                        Image.asset(
                          'images/running.gif',
                          width: 160,
                          ),
                    
                      ],
                    
                    ),
                  ),

                 Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 18,
                    
                      children: [
                    
                        NumItem(
                          colr: primaryColr, 
                          textLabel: 'Humidity', 
                          stringNum: '200',
                          ),
                    
                        NumItem(
                          colr: primaryColr, 
                          textLabel: 'Wind', 
                          stringNum: '00',
                          ),

                        NumItem(
                          colr: primaryColr, 
                          textLabel: 'Pressure', 
                          stringNum: '00',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [

                Container(
                  height: 30,
                  margin: EdgeInsets.fromLTRB(26, 20, 16, 10),
                  // color: secondHlColr,
                  
                  child: Text(
                    '// About This Weather App',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inconsolata(
                      fontSize: 14,
                      color: secondColr,
                      fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),

                  Container(
                    height: 200,
                    margin: EdgeInsets.only(left: 26, right: 26),
                    // color: secondHlColr,
                    child: Text(
                      '''
This is a simple yet functional weather application created with the purpose of showcasing programming skills through a real-world project.
The app includes the following features:

- Temperature Data, Weather Forecast, Humidity Information
- Wind Speed, Atmospheric Pressure
- Front-End Design Gimmicks

This app is built to demonstrate a blend of API integration, responsive design, and clean code architecture, making it not just a useful tool, but also a technical portfolio piece.
                      ''',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.inconsolata(
                        fontSize: 10,
                        color: secondColr,
                        fontWeight: FontWeight.normal,
                        ),
                      ),

                  ),

                ],
              ),
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
                    fontWeight: FontWeight.normal,
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

//// The stateless widget below can be uses as item which is re-useable

class NumItem extends StatelessWidget {

  final Color colr;
  final String textLabel;
  final String stringNum;

  const NumItem({
    super.key,
    required this.colr,
    required this.textLabel,
    required this.stringNum,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    
        SizedBox(
          height: 45,
          width: 90,
    
          child: Text(
          stringNum,
          textAlign: TextAlign.center,
          style: GoogleFonts.inconsolata(
            fontSize: 36,
            color: colr,
            fontWeight: FontWeight.bold,
            ),
          ),
        ),
    
        Container(
          height: 40,
          width: 90,
          padding: EdgeInsets.all(8),
          // color: secondHlColr,
          child: Text(
          textLabel,
          textAlign: TextAlign.center,
          style: GoogleFonts.inconsolata(
            fontSize: 16,
            color: colr,
            fontWeight: FontWeight.normal,
            ),
          ),
        ),
    
      ],
    );
  }
}