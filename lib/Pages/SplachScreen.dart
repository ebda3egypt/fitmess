import 'dart:async';
import 'package:flutter/services.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fitmess/Pages/ChooseLanguageScreen.dart';
import 'package:fitmess/Pages/introductionScreen.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  Color background_color = Colors.white;
  String app_logo = "assets/drawables/logo_blue.png";
  Color activeDots = Colors.white , Dotscolor = Colors.blueAccent;
  double num_position =0.0;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 30), () {
      setState(() {
        if(num_position <5.0){
          num_position += 1.0;
        }
        else{
          num_position=0.0;
        }

      });
    });

   Timer(Duration(seconds: 3), () => changeSplach());
  }

  void changeSplach(){
    setState(() {
       background_color = Colors.blue;
       app_logo = "assets/drawables/logo_white.png";
       activeDots =Colors.blueAccent ;
       Dotscolor = Colors.white;
    });
    Timer(Duration(seconds: 3), () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => ChooseLanguageScreen())));
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      backgroundColor: background_color,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  app_logo,
                  width: 180,
                  height: 180,
                ),
                SizedBox(height: 40,),
                DotsIndicator(
                  dotsCount: 5,
                  position: num_position,
                  decorator: DotsDecorator(
                    color: Dotscolor, // Inactive color
                    activeColor: activeDots,
                  ),
                )

              ]),
        ),
      ),
    );
  }
}
