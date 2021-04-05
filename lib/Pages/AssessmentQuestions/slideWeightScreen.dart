import 'package:fitmess/Enum/SelectedWeightEnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import 'package:fitmess/Widgets/AppBarWidget.dart';
import 'package:fitmess/Pages/AssessmentQuestions/InformationSummaryScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/goalIsScreen.dart';


class slideWeightScreen extends StatefulWidget {
  bool isEdit;
  slideWeightScreen(this.isEdit);

  @override
  _slideWeightScreenState createState() => _slideWeightScreenState();
}

class _slideWeightScreenState extends State<slideWeightScreen> {
  Config _config = Config();
  Color bu_color =Config.app_backgroungColor , bu_text_color = Colors.white ;
  bool is_Completed=true;


  double sliderValue = 0.1;
  String avg_num = "10 %";

  void changeColor(double v){
    if((v*100).toInt() == 0){
      is_Completed = false;
      bu_color = Colors.grey[300];
      bu_text_color = Colors.grey[600];
    }
    else{
      is_Completed = true;
      bu_color = Config.app_backgroungColor;
      bu_text_color = Colors.white;
    }

    setState(() {});
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
        body:Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
            color: Colors.white,
            child: Center(
              child: Container(
                width: double.infinity,
               // margin: EdgeInsets.only(top: 10),
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
                              "assets/drawables/ic_3.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Row(
                            children: [
                              Text(_config.get_text(context,"assessment_headline2_txt").toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color:Config.app_backgroungColor)),
                              SizedBox(width: 5,),
                              Text("(2/2)",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color:Colors.black)),
                            ],
                          )

                        ],

                      ),

                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Container(
                          width: double.infinity,
                          child: Center(
                            child:Text(_config.get_text(context, "weight_slide_txt"),textAlign: TextAlign.center,style: TextStyle(fontSize: 32),),
                          ),
                        ),
                      ),
                      SizedBox(height: 40,),
                      Container(
                        width: 200,
                        height: 200,
                        child: Image.asset(
                          "assets/drawables/body_img.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Text(avg_num,textAlign: TextAlign.center,style: TextStyle(fontSize: 32,color: Config.app_backgroungColor),),
                                SizedBox(width: 10,),
                                Image.asset("assets/drawables/ic_q.png"),
                              ],
                            ),

                            Slider(
                              value: sliderValue,

                              activeColor: Config.app_backgroungColor,
                              onChanged: (v){
                                  sliderValue = v;
                                  avg_num = "${(v*100).toInt().toString()} % ";
                                  changeColor(v);
                              },
                            ),

                          ],
                        ),
                      ),

                      SizedBox(height: 50,),

                      GestureDetector(
                          onTap: ()async{
                            if(is_Completed){

                              Config.Assessment_req['SliderValue'] = avg_num.toString();
                              
                              if(widget.isEdit){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(
                                    builder: (BuildContext context) =>InformationSummaryScreen()));
                              }
                              else{
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => goalIsScreen(false)));
                              }
                            }
                          },
                          child: Container(
                              margin:EdgeInsets.symmetric(vertical: 5,horizontal: 20),
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
