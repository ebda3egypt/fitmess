import 'package:fitmess/Helpers/Config.dart';
import'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitmess/Widgets/AppBarWidget.dart';
import 'package:fitmess/Pages/AssessmentQuestions/InformationSummaryScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/equipmentScreen.dart';

class workPlaceScreen extends StatelessWidget {

  bool isEdit;
  workPlaceScreen(this.isEdit);

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
        body:Container(
            padding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
            color: Colors.white,
            child: Center(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 0),
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
                          Row(
                            children: [
                              Text(_config.get_text(
                                  context, "assessment_headline4_txt").toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16,
                                      color: Config.app_backgroungColor)),
                              SizedBox(width: 5,),
                              Text("(4/7)", textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black)),
                            ],
                          )


                        ],

                      ),
                      SizedBox(height: 40,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        width: double.infinity,
                        child: Center(
                          child:Text(_config.get_text(context, "workout_ar_txt"),textAlign: TextAlign.center,style: TextStyle(fontSize: 32),),
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
                              onTap: ()async{

                                  if(isEdit){
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (BuildContext context) =>InformationSummaryScreen()));
                                  }
                                  else{
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) => equipmentScreen(false)));
                                    }
                              },
                              child: Container(
                                height: 170,
                                color: Color(int.parse("FFEDF7FC",radix: 16)),
                                padding: EdgeInsets.only(top: 20,bottom: 20,),
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/drawables/ic_home.png") ,
                                    SizedBox(height: 20,),
                                    Text(_config.get_text(context, "home_txt"),style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
                                  ],
                                ) ,
                              ),
                            ),
                          ),


                          Expanded(
                            flex:1,
                            child: GestureDetector(
                              onTap: ()async{

                                  if(isEdit){
                                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                                        builder: (BuildContext context) =>InformationSummaryScreen()));
                                  }
                                  else{
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) => equipmentScreen(false)));
                                  }

                              },
                              child:Container(
                                height: 170,
                                color: Color(int.parse("FFEDF7FC",radix: 16)),
                                padding: EdgeInsets.only(top: 20,bottom: 20),
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child:Center(
                                  child:Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/drawables/ic_gym.png") ,
                                      SizedBox(height: 20,),
                                      Text(_config.get_text(context, "gym_txt"),style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
                                    ],
                                  ) ,
                                ) ,
                              ),
                            ),
                          ),
                        ],
                      ),


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
