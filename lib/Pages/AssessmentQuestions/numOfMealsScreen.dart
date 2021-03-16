import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import 'package:fitmess/Widgets/AppBarWidget.dart';
import 'package:fitmess/Pages/AssessmentQuestions/InformationSummaryScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/unlikeFoodItemsScreen.dart';

class numOfMealsScreen extends StatefulWidget {
  bool isEdit;
  numOfMealsScreen(this.isEdit);

  @override
  _numOfMealsScreenState createState() => _numOfMealsScreenState();
}

class _numOfMealsScreenState extends State<numOfMealsScreen> {
  Config _config = Config();
  Color bu_color =Colors.grey[300] , bu_text_color = Colors.grey[600] ;
  Color lose_bu =Colors.grey[100] , lose_bu_text_color = Colors.grey[600] ;
  Color Gain_bu =Colors.grey[100] , Gain_bu_text_color = Colors.grey[600] ;
  Color Maintaine_bu =Colors.grey[100] , Maintaine_bu_text_color = Colors.grey[600] ;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      //or set color with: Color(0xFF0000FF)
    ));

    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget().AppBarWid(),
        body:Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
            color: Colors.white,
            child: Center(
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              "assets/drawables/ic_4.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Text(_config.get_text(context,"assessment_headline4_txt").toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color:Colors.black))
                        ],

                      ),
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: double.infinity,
                          child: Center(
                            child:Text(_config.get_text(context, "meal_text_headline"),textAlign: TextAlign.center,style: TextStyle(fontSize: 40),),
                          ),
                        ),
                      ),
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: (){
                                  if(widget.isEdit){
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (BuildContext context) =>InformationSummaryScreen()));
                                  }
                                  else{
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) => unlikeFoodItemsScreen(false)));
                                  }
                                },
                                child: Container(
                                    child: LanguageSubmitButton(bu_text: _config.get_text(context,"meal_text_1").toString(),bu_color: lose_bu ,textColor: lose_bu_text_color,))),

                            SizedBox(height: 10,),

                            GestureDetector(
                                onTap: (){
                                  if(widget.isEdit){
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (BuildContext context) =>InformationSummaryScreen()));
                                  }
                                  else{
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) => unlikeFoodItemsScreen(false)));
                                  }

                                },
                                child: Container(
                                    child: LanguageSubmitButton(bu_text: _config.get_text(context,"meal_text_2").toString(),bu_color: Gain_bu ,textColor: Gain_bu_text_color,))),

                            SizedBox(height: 10,),

                            GestureDetector(
                                onTap: (){
                                  if(widget.isEdit){
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (BuildContext context) =>InformationSummaryScreen()));
                                  }
                                  else{
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) => unlikeFoodItemsScreen(false)));
                                  }
                                },
                                child: Container(
                                    child: LanguageSubmitButton(bu_text: _config.get_text(context,"meal_text_3").toString(),bu_color: Maintaine_bu ,textColor: Maintaine_bu_text_color,))),

                            SizedBox(height: 10,),

                            GestureDetector(
                                onTap: (){
                                  if(widget.isEdit){
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (BuildContext context) =>InformationSummaryScreen()));
                                  }
                                  else{
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) => unlikeFoodItemsScreen(false)));
                                  }
                                },
                                child: Container(
                                    child: LanguageSubmitButton(bu_text: _config.get_text(context,"meal_text_4").toString(),bu_color: Maintaine_bu ,textColor: Maintaine_bu_text_color,))),

                            SizedBox(height: 10,),

                            GestureDetector(
                                onTap: (){
                                  if(widget.isEdit){
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (BuildContext context) =>InformationSummaryScreen()));
                                  }
                                  else{
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) => unlikeFoodItemsScreen(false)));
                                  }
                                },
                                child: Container(
                                    child: LanguageSubmitButton(bu_text: _config.get_text(context,"meal_text_5").toString(),bu_color: Maintaine_bu ,textColor: Maintaine_bu_text_color,))),


                          ],
                        ),
                      ),

                      SizedBox(height: 80,),


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
