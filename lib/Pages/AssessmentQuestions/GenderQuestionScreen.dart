import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Models/IntroductionModel.dart';
import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitmess/Widgets/AppBarWidget.dart';
import 'package:fitmess/Pages/AssessmentQuestions/HeightQuestionScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/InformationSummaryScreen.dart';

class GenderQuestionScreen extends StatelessWidget {
  bool isEdit;
  GenderQuestionScreen(this.isEdit);

  Config _config = Config();
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
        body: Padding(
          padding: const EdgeInsets.only(top:20),
          child:Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
            color: Colors.white,
            child: Center(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 80),
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
                              "assets/drawables/ic_1.png",
                              fit: BoxFit.cover,
                            ),
                          ),

                          SizedBox(width: 10,),
                          Text(_config.get_text(context,"assessment_headline1_txt").toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color:Colors.black))


                        ],

                      ),
                      SizedBox(height: 40,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        child: Center(
                          child:Text(_config.get_text(context, "assessment_q2_txt"),textAlign: TextAlign.center,style: TextStyle(fontSize: 40),),
                        ),
                      ),
                      SizedBox(height: 40,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Expanded(
                            flex:1,
                            child: GestureDetector(
                              onTap: (){
                                if(isEdit){
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      builder: (BuildContext context) =>InformationSummaryScreen()));
                                }
                                else
                                {
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      builder: (BuildContext context) => HeightQuestionScreen(false)));
                                }

                              },
                              child:Container(
                                height: 170,
                                color: Colors.grey[200],
                                padding: EdgeInsets.only(top: 20,bottom: 20,),
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/drawables/ic_male.png") ,
                                    SizedBox(height: 20,),
                                    Text(_config.get_text(context, "assessment_Male_txt"),style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
                                  ],
                                ) ,
                              ),
                            )
                          ),


                          Expanded(
                            flex:1,
                            child: GestureDetector(
                              onTap: (){
                                if(isEdit){
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      builder: (BuildContext context) =>InformationSummaryScreen()));
                                }
                                else
                                {
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      builder: (BuildContext context) => HeightQuestionScreen(false)));
                                }

                              },
                              child:Container(
                                height: 170,
                                color: Colors.grey[200],
                                padding: EdgeInsets.only(top: 20,bottom: 20),
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child:Center(
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/drawables/ic_female.png") ,
                                      SizedBox(height: 20,),
                                      Text(_config.get_text(context, "assessment_Female_txt"),style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
                                    ],
                                  ) ,
                                ) ,
                              ),
                            )
                          ),
                        ],
                      ),

                      SizedBox(height: 50,),



                      SizedBox(height: 20,),



                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
