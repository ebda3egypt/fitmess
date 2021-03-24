import 'package:fitmess/Enum/SelectedWeightEnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import 'package:fitmess/Widgets/AppBarWidget.dart';
import 'package:fitmess/Pages/AssessmentQuestions/InformationSummaryScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/goalWeightScreen.dart';



class goalIsScreen extends StatefulWidget {
  bool isEdit;
  goalIsScreen(this.isEdit);
  @override
  _goalIsScreenState createState() => _goalIsScreenState();
}

class _goalIsScreenState extends State<goalIsScreen> {
  Config _config = Config();
  Color bu_color =Color(int.parse("FFEDF7FC",radix: 16)) , bu_text_color = Colors.black ;
  Color lose_bu =Color(int.parse("FFEDF7FC",radix: 16)) , lose_bu_text_color = Colors.black ;
  Color Gain_bu =Color(int.parse("FFEDF7FC",radix: 16)) , Gain_bu_text_color = Colors.black ;
  Color Maintaine_bu =Color(int.parse("FFEDF7FC",radix: 16)) , Maintaine_bu_text_color = Colors.black ;

  String hintText = "";
  String selected_bu="";
  SelectedWeigtEnum selectedWeigtEnum= SelectedWeigtEnum.none;

  bool is_kg =false,is_Completed=false;

  GlobalKey<FormState> _formKey;

  void change_bu_color(int num){
    switch (num){
      case 1:

            if(selectedWeigtEnum == SelectedWeigtEnum.none){
              lose_bu =Config.app_backgroungColor;
              lose_bu_text_color = Colors.white;
              selectedWeigtEnum = SelectedWeigtEnum.lose;
              changeColor();
            }
            else if(selectedWeigtEnum == SelectedWeigtEnum.lose){
              lose_bu =Color(int.parse("FFEDF7FC",radix: 16));
              lose_bu_text_color = Colors.black;
              selectedWeigtEnum = SelectedWeigtEnum.none;
              changeColor();
            }
            else{
              lose_bu =Config.app_backgroungColor;
              lose_bu_text_color = Colors.white;
              Gain_bu =Color(int.parse("FFEDF7FC",radix: 16));
              Gain_bu_text_color = Colors.black;
              Maintaine_bu =Color(int.parse("FFEDF7FC",radix: 16));
              Maintaine_bu_text_color =Colors.black;
              selectedWeigtEnum = SelectedWeigtEnum.lose;
              changeColor();
            }

        break;
      case 2:

          if(selectedWeigtEnum == SelectedWeigtEnum.none){
            Gain_bu =Config.app_backgroungColor;
            Gain_bu_text_color = Colors.white;
            selectedWeigtEnum = SelectedWeigtEnum.gain;
            changeColor();
          }
          else if(selectedWeigtEnum == SelectedWeigtEnum.gain){
            Gain_bu =Color(int.parse("FFEDF7FC",radix: 16));
            Gain_bu_text_color = Colors.black;
            selectedWeigtEnum = SelectedWeigtEnum.none;
            changeColor();
          }
          else{
            Gain_bu =Config.app_backgroungColor;
            Gain_bu_text_color = Colors.white;
            lose_bu =Color(int.parse("FFEDF7FC",radix: 16));
            lose_bu_text_color = Colors.black;
            Maintaine_bu =Color(int.parse("FFEDF7FC",radix: 16));
            Maintaine_bu_text_color =Colors.black;
            selectedWeigtEnum = SelectedWeigtEnum.gain;
            changeColor();
          }

        break;
      case 3:

          if(selectedWeigtEnum == SelectedWeigtEnum.none){
            Maintaine_bu =Config.app_backgroungColor;
            Maintaine_bu_text_color = Colors.white;
            selectedWeigtEnum = SelectedWeigtEnum.maintain;
            changeColor();
          }
          else if(selectedWeigtEnum == SelectedWeigtEnum.maintain){
            Maintaine_bu =Color(int.parse("FFEDF7FC",radix: 16));
            Maintaine_bu_text_color = Colors.black;
            selectedWeigtEnum = SelectedWeigtEnum.none;
            changeColor();
          }
          else{
            Maintaine_bu =Config.app_backgroungColor;
            Maintaine_bu_text_color = Colors.white;
            Gain_bu =Color(int.parse("FFEDF7FC",radix: 16));
            Gain_bu_text_color = Colors.black;
            lose_bu =Color(int.parse("FFEDF7FC",radix: 16));
            lose_bu_text_color =Colors.black;
            selectedWeigtEnum = SelectedWeigtEnum.maintain;
            changeColor();
          }

        break;



    }
  }

  void changeColor(){
    if(selectedWeigtEnum == SelectedWeigtEnum.none){
      is_Completed = false;
      bu_color = Color(int.parse("FFEDF7FC",radix: 16));
      bu_text_color = Colors.black;
    }
    else{
      is_Completed = true;
      bu_color = Config.app_backgroungColor;
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
                              "assets/drawables/ic_2.png",
                              fit: BoxFit.cover,
                            ),
                          ),

                          SizedBox(width: 10,),
                          Row(
                            children: [
                              Text(_config.get_text(context,"assessment_headline3_txt").toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color:Config.app_backgroungColor)),
                              SizedBox(width: 5,),
                              Text("(1/3)",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color:Colors.black)),
                            ],
                          )


                        ],

                      ),
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80),
                        child: Container(
                          width: double.infinity,
                          child: Center(
                            child:Text(_config.get_text(context, "weight_goal_txt1"),textAlign: TextAlign.center,style: TextStyle(fontSize: 32),),
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
                              go_to_navigate();
                            },
                            child: Container(
                                child: LanguageSubmitButton(bu_text: _config.get_text(context,"weight_lose_txt").toString(),bu_color: lose_bu ,textColor: lose_bu_text_color,))),

                            SizedBox(height: 10,),

                            GestureDetector(
                                onTap: (){
                                  go_to_navigate();
                                },
                                child: Container(
                                    child: LanguageSubmitButton(bu_text: _config.get_text(context,"weight_gain_txt").toString(),bu_color: Gain_bu ,textColor: Gain_bu_text_color,))),

                            SizedBox(height: 10,),

                            GestureDetector(
                                onTap: (){
                                  go_to_navigate();
                                },
                                child: Container(
                                    child: LanguageSubmitButton(bu_text: _config.get_text(context,"weight_maintaine_txt").toString(),bu_color: Maintaine_bu ,textColor: Maintaine_bu_text_color,))),


                          ],
                        ),
                      ),

                      SizedBox(height: 80,),

                    /*  GestureDetector(
                          onTap: ()async{
                            if(is_Completed){
                              if(widget.isEdit){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) =>InformationSummaryScreen()));
                              }
                              else{
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => goalWeightScreen(false)));
                              }
                            }
                          },
                          child: Container(
                              margin:EdgeInsets.symmetric(vertical: 5,horizontal: 50),
                              child: LanguageSubmitButton(bu_text: _config.get_text(context,"assessment_continue_txt").toString(),bu_color: bu_color ,textColor: bu_text_color,))),*/


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

  void go_to_navigate() {
    if (widget.isEdit) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => InformationSummaryScreen()));
    }
    else {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => goalWeightScreen(false)));
    }
  }

}
