import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import 'package:fitmess/Pages/HomePage.dart';
import 'package:flutter/services.dart';
import 'package:fitmess/Pages/AssessmentQuestions/BodyNeedsScreen.dart';

class AssessmentDoneScreen extends StatefulWidget {
  @override
  _AssessmentDoneScreenState createState() => _AssessmentDoneScreenState();
}

class _AssessmentDoneScreenState extends State<AssessmentDoneScreen> {
  Config _config = Config();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 2), () => Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => BodyNeedsScreen())));
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      //or set color with: Color(0xFF0000FF)
    ));


    return Material(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top:20),
          child:Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
            color: Colors.white,
            child: Center(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 336,
                      height: 339,
                      child: Image.asset(
                        "assets/drawables/img_done.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 40,),

                    Container(
                        margin: EdgeInsets.symmetric(vertical: 0,horizontal: 40),
                        child:Text(_config.get_text(context,"assessment_done_text").toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 32,color:Colors.black))

                    ),
                    SizedBox(height: 40,),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 0,horizontal: 40),
                        child:Text(_config.get_text(context,"assessment_done_text2").toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color:Colors.black))

                    ),
                    SizedBox(height: 30,),



                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

