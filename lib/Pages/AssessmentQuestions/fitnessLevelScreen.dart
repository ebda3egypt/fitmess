import 'package:fitmess/Enum/SelectedWeightEnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import 'package:fitmess/Widgets/AppBarWidget.dart';
import 'package:fitmess/Pages/AssessmentQuestions/InformationSummaryScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/numberOfWorkoutsScreen.dart';


class fitnessLevelScreen extends StatefulWidget {
  bool isEdit;
  fitnessLevelScreen(this.isEdit);
  @override
  _fitnessLevelScreenState createState() => _fitnessLevelScreenState();
}

class _fitnessLevelScreenState extends State<fitnessLevelScreen> {
  Config _config = Config();
  Color bu_color =Colors.grey[300] , bu_text_color = Colors.grey[600] ;
  Color lose_bu =Colors.grey[100] , lose_bu_text_color = Colors.grey[600] ;
  Color Gain_bu =Colors.grey[100] , Gain_bu_text_color = Colors.grey[600] ;
  Color Maintaine_bu =Colors.grey[100] , Maintaine_bu_text_color = Colors.grey[600] ;

  String hintText = "";
  String selected_bu="";
  SelectedWeigtEnum selectedWeigtEnum= SelectedWeigtEnum.none;

  bool is_kg =false,is_Completed=false;

  GlobalKey<FormState> _formKey;

  void change_bu_color(int num){
    switch (num){
      case 1:

        if(selectedWeigtEnum == SelectedWeigtEnum.none){
          lose_bu =Colors.blue;
          lose_bu_text_color = Colors.white;
          selectedWeigtEnum = SelectedWeigtEnum.lose;
          changeColor();
        }
        else if(selectedWeigtEnum == SelectedWeigtEnum.lose){
          lose_bu =Colors.grey[100];
          lose_bu_text_color = Colors.grey[600];
          selectedWeigtEnum = SelectedWeigtEnum.none;
          changeColor();
        }
        else{
          lose_bu =Colors.blue;
          lose_bu_text_color = Colors.white;
          Gain_bu =Colors.grey[100];
          Gain_bu_text_color = Colors.grey[600];
          Maintaine_bu =Colors.grey[100];
          Maintaine_bu_text_color =Colors.grey[600];
          selectedWeigtEnum = SelectedWeigtEnum.lose;
          changeColor();
        }

        break;
      case 2:

        if(selectedWeigtEnum == SelectedWeigtEnum.none){
          Gain_bu =Colors.blue;
          Gain_bu_text_color = Colors.white;
          selectedWeigtEnum = SelectedWeigtEnum.gain;
          changeColor();
        }
        else if(selectedWeigtEnum == SelectedWeigtEnum.gain){
          Gain_bu =Colors.grey[100];
          Gain_bu_text_color = Colors.grey[600];
          selectedWeigtEnum = SelectedWeigtEnum.none;
          changeColor();
        }
        else{
          Gain_bu =Colors.blue;
          Gain_bu_text_color = Colors.white;
          lose_bu =Colors.grey[100];
          lose_bu_text_color = Colors.grey[600];
          Maintaine_bu =Colors.grey[100];
          Maintaine_bu_text_color =Colors.grey[600];
          selectedWeigtEnum = SelectedWeigtEnum.gain;
          changeColor();
        }

        break;
      case 3:

        if(selectedWeigtEnum == SelectedWeigtEnum.none){
          Maintaine_bu =Colors.blue;
          Maintaine_bu_text_color = Colors.white;
          selectedWeigtEnum = SelectedWeigtEnum.maintain;
          changeColor();
        }
        else if(selectedWeigtEnum == SelectedWeigtEnum.maintain){
          Maintaine_bu =Colors.grey[100];
          Maintaine_bu_text_color = Colors.grey[600];
          selectedWeigtEnum = SelectedWeigtEnum.none;
          changeColor();
        }
        else{
          Maintaine_bu =Colors.blue;
          Maintaine_bu_text_color = Colors.white;
          Gain_bu =Colors.grey[100];
          Gain_bu_text_color = Colors.grey[600];
          lose_bu =Colors.grey[100];
          lose_bu_text_color =Colors.grey[600];
          selectedWeigtEnum = SelectedWeigtEnum.maintain;
          changeColor();
        }

        break;



    }
  }

  void changeColor(){
    if(selectedWeigtEnum == SelectedWeigtEnum.none){
      is_Completed = false;
      bu_color = Colors.grey[300];
      bu_text_color = Colors.grey[600];
    }
    else{
      is_Completed = true;
      bu_color = Colors.blue;
      bu_text_color = Colors.white;
    }

    setState(() {});
  }



  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    hintText= _config.get_text(context,"height_universal_unit_txt").toString();
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
        backgroundColor: Colors.white,
        appBar: AppBarWidget().AppBarWid(),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
            color: Colors.white,
            child: Center(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20),
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
                            child:Text(_config.get_text(context, "fitness_level_txt"),textAlign: TextAlign.center,style: TextStyle(fontSize: 40),),
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
                                  change_bu_color(1);
                                },
                                child: Container(
                                    child: LanguageSubmitButton(bu_text: _config.get_text(context,"fitness_level_bu_1").toString(),bu_color: lose_bu ,textColor: lose_bu_text_color,))),

                            SizedBox(height: 10,),

                            GestureDetector(
                                onTap: (){
                                  change_bu_color(2);
                                },
                                child: Container(
                                    child: LanguageSubmitButton(bu_text: _config.get_text(context,"fitness_level_bu_2").toString(),bu_color: Gain_bu ,textColor: Gain_bu_text_color,))),

                            SizedBox(height: 10,),

                            GestureDetector(
                                onTap: (){
                                  change_bu_color(3);
                                },
                                child: Container(
                                    child: LanguageSubmitButton(bu_text: _config.get_text(context,"fitness_level_bu_3").toString(),bu_color: Maintaine_bu ,textColor: Maintaine_bu_text_color,))),


                          ],
                        ),
                      ),

                      SizedBox(height: 80,),

                      GestureDetector(
                          onTap: ()async{
                            if(is_Completed){
                              if(widget.isEdit){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) =>InformationSummaryScreen()));
                              }
                              else{
                                 Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => numberOfWorkoutsScreen(false)));
                              }
                            }
                          },
                          child: Container(
                              margin:EdgeInsets.symmetric(vertical: 5,horizontal: 50),
                              child: LanguageSubmitButton(bu_text: _config.get_text(context,"assessment_continue_txt").toString(),bu_color: bu_color ,textColor: bu_text_color,))),


                      SizedBox(height: 20,),



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
