import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import "dart:math";

//// The stateless widget below can be uses as item which is re-useable


class CarouselItem extends StatelessWidget {

  final Color bgColr;
  final Color textColr;
  final String imgs;
  final String timee;
  final String ddate;
  final String temperatureNum;

  const CarouselItem({
      super.key,
      required this.bgColr,
      required this.textColr,
      required this.imgs,
      required this.timee,
      required this.ddate,
      required this.temperatureNum,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(6),
      color: bgColr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
        children: [

          Image.asset(
                imgs,
                height: 100,
              ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              
                  Container(
                    height: 23,
                    width: 100,
                    padding: EdgeInsets.all(1),
                    // color: secondHlColr,
                    child: Text(
                    'Time',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inconsolata(
                      fontSize: 18,
                      color: textColr,
                      fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
              
                  Container(
                    height: 44,
                    width: 100,
                    padding: EdgeInsets.all(2),
                    // color: secondHlColr,
                    child: Text(
                    timee,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inconsolata(
                      fontSize: 32,
                      color: textColr,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    height: 20,
                    width: 100,
                    padding: EdgeInsets.all(1),
                    // color: secondHlColr,
                    child: Text(
                    ddate,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inconsolata(
                      fontSize: 14,
                      color: textColr,
                      fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
              
                ],
              ),

              Container(
                color: textColr,
                height: 90,
                width: 2,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    height: 60,
                    width: 90,
                    padding: EdgeInsets.all(4),
                    // color: secondHlColr,
                    child: Text(
                    temperatureNum,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inconsolata(
                      fontSize: 32,
                      color: textColr,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    height: 26,
                    width: 90,
                    padding: EdgeInsets.all(4),
                    // color: secondHlColr,
                    child: Text(
                    'CELCIUS',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inconsolata(
                      fontSize: 12,
                      color: textColr,
                      fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),

                ],
              ),

            ],
          ),


        ],
      ),
    );
  }
}


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
            fontSize: 32,
            color: colr,
            fontWeight: FontWeight.bold,
            ),
          ),
        ),
    
        Container(
          height: 40,
          width: 90,
          padding: EdgeInsets.all(6),
          // color: secondHlColr,
          child: Text(
          textLabel,
          textAlign: TextAlign.center,
          style: GoogleFonts.inconsolata(
            fontSize: 14,
            color: colr,
            fontWeight: FontWeight.normal,
            ),
          ),
        ),
    
      ],
    );
  }
}


class BottomInfo extends StatelessWidget {

  final Color pcolr;
  final Color scolr;
  final Color shcolr;
  final String textLong;

  const BottomInfo({
    super.key,
    required this.pcolr,
    required this.scolr,
    required this.shcolr,
    required this.textLong,
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      style: ButtonStyle(
          padding: WidgetStateProperty.all(EdgeInsets.all(6)),
          elevation: WidgetStateProperty.all(0),
          backgroundColor: WidgetStateProperty.all(pcolr),
          surfaceTintColor: WidgetStateProperty.all(pcolr),
          overlayColor: WidgetStateProperty.all(shcolr),
          minimumSize: WidgetStatePropertyAll(Size(400, 10)),
          
        ),

      onPressed: () {
        showModalBottomSheet(
    
        context: context,
        isDismissible: true,

        backgroundColor: pcolr,
        barrierColor: Color.fromRGBO(0, 0, 0, 0.2),
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.2),
            ),
        
        isScrollControlled: true,

        builder: (context) {
          return Container(
            height: 460,
            padding: EdgeInsets.only(left: 26, right: 26),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                
                    Container(
                      height: 30,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      // color: secondHlColr,
                      
                      child: Text(
                        '// About This Weather App',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.inconsolata(
                          fontSize: 15,
                          color: scolr,
                          fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 300,
                        child: Text(
                          textLong,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.inconsolata(
                            fontSize: 11,
                            color: scolr,
                            fontWeight: FontWeight.normal,
                            ),
                          ),
                      ),
                
                    ],
                  ),
          );
            },
          );
        },

      child: Icon(
        Icons.keyboard_arrow_up,
        color: scolr,
        size: 12,
        ),
      
    );
  }
}


// class WeatherImage extends StatelessWidget {
//   const WeatherImage({super.key});

//   @override
//   Widget build(BuildContext context) {


//     return Image.asset(
//       'images/waterfall.gif',
//       height: 45,
//     );
//   }
// }

String getWeatherImage(String weathers, double feelTemp) {

  String imageShow = 'images/waiting.gif';
  
  List<String> hotlst = ['images/hot_level1.gif', 'images/hot_level2.gif', 'images/hot_level3.gif', 'images/hot_level4.gif'];
  List<String> coldlst = ['images/cold_level1.gif', 'images/cold_level2.gif', 'images/cold_level3.gif', 'images/cold_level4.gif'];
  List<String> rainlst = ['images/rainfall_level0.gif', 'images/rainfall_level1.gif', 'images/rainfall_level2.gif', 'images/rainfall_level3.gif'];
  List<String> cloudlst = ['images/cloudy_level1.gif', 'images/cloudy_level2.gif', 'images/cloudy_level3.gif', 'images/cloudy_level4.gif'];

  switch (weathers) {
    case 'Clear':

      if (feelTemp <= 290) {
        imageShow = coldlst[Random().nextInt(coldlst.length)];
      } else {
        imageShow = hotlst[Random().nextInt(hotlst.length)];
      }
      break;

    case 'Clouds':
      imageShow = cloudlst[Random().nextInt(cloudlst.length)];
      break;

    case 'Rain':
      imageShow = rainlst[Random().nextInt(rainlst.length)];
      break;
  }

  return imageShow;
}
