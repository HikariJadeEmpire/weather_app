import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:my_weather/secret.dart';
import 'myComponent.dart';

class MyWeatherApp extends StatefulWidget {
  const MyWeatherApp({super.key});

  @override
  State<MyWeatherApp> createState() {
    return _MyWeatherApp();
  }
}

class _MyWeatherApp extends State<MyWeatherApp> { 

  final String aboutText = '''
This is a simple yet functional weather application created with the purpose of showcasing programming skills through a real-world project.
The app includes the following features:

- Temperature Data, Weather Forecast, Humidity Information
- Wind Speed, Atmospheric Pressure
- Front-End Design Gimmicks

This app is built to demonstrate a blend of API integration, responsive design, and clean code architecture, making it not just a useful tool, but also a technical portfolio piece.

                    ''';

  final primaryColr = Color.fromRGBO(255, 255, 255, 1);
  final secondColr = Color.fromRGBO(19, 19, 20, 1);
  final secondHlColr = Color.fromRGBO(121, 121, 121, 0.5);

  final limeColr = Color.fromRGBO(218, 240, 89, 1);
  final blueColr = Color.fromRGBO(47, 49, 245, 1);
  final lightBlueColr = Color.fromRGBO(0, 166, 192, 1);
  final platinumColr = Color.fromRGBO(235, 235, 233, 1);
  final platinumHlColr = Color.fromRGBO(235, 235, 233, 0.3);

  final bool _pinned = false;
  final bool _snap = false;
  final bool _floating = true;

  String cityName = 'Bangkok';

  List<dynamic>? forecastTemp = List.filled(4, 
    {
      "dt": 1750291200,
      "main": {
        "temp": 273.15,
        "feels_like": 273.15,
        "temp_min": 273.15,
        "temp_max": 273.15,
        "pressure": 0,
        "sea_level": 0,
        "grnd_level": 0,
        "humidity": 0,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 001,
          "main": "NULL",
          "description": "NULL",
          "icon": "NULL"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 0,
        "deg": 0,
        "gust": 0
      },
      "visibility": 0,
      "pop": 0,
      "sys": {
        "pod": "NULL"
      },
      "dt_txt": "2025-06-17 00:00:00"
    }
    , growable: true);

  @override
  void initState() {
    super.initState();
    getWeatherApi();
  }

  Future getWeatherApi() async {
    await Future.delayed(const Duration(seconds: 1));
    try {

      final reslt = await http.get(
        Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherApiKey')
      );

      final data = jsonDecode(reslt.body);

      if ( data['cod'] != '200' ) {
        throw 'Reponse code : ${data['cod']}';
      }

      bool steps = true;
      for (int i = 0 ; steps ; i++) {

        DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(data['list'][i]['dt'] * 1000, isUtc: true);

        if (
          dateTime.hour >= DateTime.now().hour 
          && dateTime.day >= DateTime.now().day
        ) {
            forecastTemp![0] = data['list'][i - 1];
            forecastTemp![1] = data['list'][i];
            forecastTemp![2] = data['list'][i + 1];
            forecastTemp![3] = data['list'][i + 2];

            steps = false;
            break;
        }

      }
    
      return 0;

    }
    catch (e) {
      // throw e;
      debugPrint('Error as : $e');
    }

  }

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
      
      body:  
        FutureBuilder(
          future: getWeatherApi(),
          builder: (context, asyncSnapshot) {

            debugPrint('${asyncSnapshot.connectionState}');

            if (asyncSnapshot.hasError) {
              return Center(
                child: Text(asyncSnapshot.error.toString()),
              );
            }

            return CustomScrollView(
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
                    height: 78,
                    width: 56,
                    child: InkWell(
                      
                      radius: 10,
                      borderRadius: BorderRadius.all(Radius.circular(800)),
                    
                      highlightColor: secondHlColr,
                    
                      child: IconButton(
                        padding: EdgeInsets.all(2),
                        onPressed: () {
                          debugPrint('refresh');
                          setState(() {
                            getWeatherApi(); // Re-fetch data
                          });
                        },
                        icon: Icon(Icons.refresh_rounded),
                        splashRadius: 8,
                      
                        iconSize: 25,
                      
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
                          'LOCATION : $cityName',
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // spacing: 18,
                        
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
                              stringNum: (forecastTemp?[0]['main']['temp'] - 273.15).toStringAsFixed(2),
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
                                  forecastTemp?[0]['weather'][0]['main'],
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
                        // color: secondHlColr,
                        margin: EdgeInsets.fromLTRB(6, 12, 6, 2),
                        height: 26,
                        
                        child: Text(
                          'feels like : ${(forecastTemp?[0]['main']['feels_like'] - 273.15).toStringAsFixed(2)} celcius',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.inconsolata(
                            fontSize: 14,
                            color: primaryColr,
                            fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
            
                      Container(
                        height: 260,
                        margin: EdgeInsets.all(5),
            
                        child: CarouselSlider(
                            items: [
            
                              CarouselItem(
                                textColr: secondColr,
                                bgColr: limeColr,
                                imgs: getWeatherImage(forecastTemp?[1]['weather'][0]['main'], forecastTemp?[1]['main']['feels_like']),
            
                                temperatureNum: (forecastTemp?[1]['main']['temp'] - 273.15).toStringAsFixed(2),
                                timee: (forecastTemp![1]['dt_txt']).substring(11, 16),
                                ddate: (forecastTemp![1]['dt_txt']).substring(0, 10),
                              ),
            
                              CarouselItem(
                                textColr: primaryColr,
                                bgColr: blueColr,
                                imgs: getWeatherImage(forecastTemp?[2]['weather'][0]['main'], forecastTemp?[2]['main']['feels_like']),
            
                                temperatureNum: (forecastTemp?[2]['main']['temp'] - 273.15).toStringAsFixed(2),
                                timee: (forecastTemp![2]['dt_txt']).substring(11, 16),
                                ddate: (forecastTemp![2]['dt_txt']).substring(0, 10),
                              ),
            
                              CarouselItem(
                                textColr: secondColr,
                                bgColr: lightBlueColr,
                                imgs: getWeatherImage(forecastTemp?[3]['weather'][0]['main'], forecastTemp?[3]['main']['feels_like']),
            
                                temperatureNum: (forecastTemp?[3]['main']['temp'] - 273.15).toStringAsFixed(2),
                                timee: (forecastTemp![3]['dt_txt']).substring(11, 16),
                                ddate: (forecastTemp![3]['dt_txt']).substring(0, 10),
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
                        // color: secondHlColr,
                        margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
                        height: 36,
                        
                        child: Text(
                          'min : ${(forecastTemp?[0]['main']['temp_min'] - 273.15).toStringAsFixed(2)} celcius      max : ${(forecastTemp?[0]['main']['temp_max'] - 273.15).toStringAsFixed(2)} celcius',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.inconsolata(
                            fontSize: 14,
                            color: primaryColr,
                            fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
            
                    Container(
                        color: secondColr,
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // spacing: 18,
                        
                          children: [
                        
                            NumItem(
                              colr: primaryColr, 
                              textLabel: 'Humidity', 
                              stringNum: (forecastTemp?[0]['main']['humidity']).toStringAsFixed(2),
                              ),
                        
                            NumItem(
                              colr: primaryColr, 
                              textLabel: 'Wind speed', 
                              stringNum: (forecastTemp?[0]['wind']['speed']).toStringAsFixed(2),
                              ),
            
                            NumItem(
                              colr: primaryColr, 
                              textLabel: 'Pressure', 
                              stringNum: (forecastTemp?[0]['main']['pressure']).toString(),
                              ),
                        
                          ],
                        
                        ),
                      ),
            
                     // To Place
            
                    ],
                  )
                )
            
            
              ////// The code below is just an examples
            
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
                  );
          }
        ),

    bottomNavigationBar: Container(
      color: primaryColr,
      height: 160,
      child: Column(
        children: [

          Container(

            margin: EdgeInsets.all(4),
            height: 24,
            
            child: BottomInfo(pcolr: primaryColr, scolr: secondColr, shcolr: platinumHlColr, textLong: aboutText),
            ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: [
              Container(
                // color: secondHlColr,
          
                margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
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
