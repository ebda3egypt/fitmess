import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import 'package:fitmess/Widgets/AppBarWidget.dart';
import 'package:fitmess/Pages/AssessmentQuestions/GenderQuestionScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/InformationSummaryScreen.dart';

class birthdayQuestionScreen extends StatefulWidget {
  bool isEdit;
  birthdayQuestionScreen(this.isEdit);
  @override
  _birthdayQuestionScreenState createState() => _birthdayQuestionScreenState();
}

class _birthdayQuestionScreenState extends State<birthdayQuestionScreen> {
  Config _config = Config();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Color bu_color =Colors.grey[300] , bu_text_color = Colors.grey[600];
  bool is_Completed =false;
  String text_1="",text_2="",text_3="",text_4="",text_5="",text_6="",text_7="",text_8="";
  final firstFocus = FocusNode();
  final secondFocus = FocusNode();
  final thirdFocus = FocusNode();
  final forthFocus = FocusNode();
  final fifthFocus = FocusNode();
  final sixthFocus = FocusNode();
  final seventhFocus = FocusNode();
  final eighthFocus = FocusNode();

  GlobalKey<FormState> _formKey;

  void changeColor(){
    is_Completed = true;
    bu_color = Config.app_backgroungColor;
    bu_text_color = Colors.white;
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
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBarWidget().AppBarWid(),
        body: Padding(
          padding: const EdgeInsets.only(top:10),
          child:Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
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
                              "assets/drawables/ic_1.png",
                              fit: BoxFit.cover,
                            ),
                          ),

                          SizedBox(width: 10,),
                          Row(
                            children: [
                              Text(_config.get_text(context,"assessment_headline1_txt").toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color:Config.app_backgroungColor)),
                              SizedBox(width: 5,),
                              Text("(1/3)",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color:Config.app_backgroungColor)),
                            ],
                          )


                        ],

                      ),
                      SizedBox(height: 40,),
                      Container(
                        width: double.infinity,
                        child: Center(
                          child:Text(_config.get_text(context, "assessment_q1_txt"),textAlign: TextAlign.center,style: TextStyle(fontSize: 40),),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        transform: Matrix4.translationValues(0.0, -20.0, 0.0),

                        child: Center(
                          child:Text(_config.get_text(context, "assessment_q11_txt"),textAlign: TextAlign.center,style: TextStyle(fontSize: 40),),
                        ),
                      ),
                      SizedBox(height: 40,),
                      Form(
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 33,
                                  height: 60,
                                  child: TextFormField(
                                    focusNode: firstFocus,
                                    textInputAction: TextInputAction.next,
                                    autofocus: true,
                                    maxLength: 1,
                                    style: TextStyle(fontSize: 32,color: Config.app_backgroungColor),
                                    decoration: InputDecoration(hintText: 'D',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,
                                    onChanged: (v){
                                      text_1=v.toString();

                                      if(v.length==1){
                                        firstFocus.nextFocus();

                                        // FocusScope.of(context).requestFocus(focus);
                                      }

                                    },
                                  ),
                                ),
                                Container(
                                  width: 33,
                                  height: 60,
                                  child: TextFormField(
                                    focusNode: secondFocus,
                                    style: TextStyle(fontSize: 32,color: Config.app_backgroungColor),
                                    maxLength: 1,
                                    decoration: InputDecoration(hintText: 'D',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,
                                    onChanged: (t){
                                      text_2=t.toString();

                                      if(t.length==1){
                                        secondFocus.nextFocus();

                                      }
                                      if(t.length == 0){
                                        secondFocus.previousFocus();
                                      }
                                    },

                                  ),
                                ),

                                Container(
                                  width: 33,
                                  height: 60,
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    autofocus: true,
                                    maxLength: 1,
                                    enabled: false,
                                    style: TextStyle(fontSize: 32),
                                    decoration: InputDecoration(hintText: '/',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,

                                  ),
                                ),

                                Container(
                                  width: 33,
                                  height: 60,
                                  child: TextFormField(
                                    focusNode: thirdFocus,
                                    textInputAction: TextInputAction.next,
                                    autofocus: true,
                                    maxLength: 1,
                                    style: TextStyle(fontSize: 32,color: Config.app_backgroungColor),
                                    decoration: InputDecoration(hintText: 'M',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,
                                    onChanged: (v){
                                      text_3=v.toString();
                                      if(v.length==1){
                                        thirdFocus.nextFocus();
                                      }
                                      if(v.length == 0){
                                        thirdFocus.previousFocus();
                                      }

                                    },
                                  ),
                                ),
                                Container(
                                  width: 33,
                                  height: 60,
                                  child: TextFormField(
                                    focusNode: forthFocus,
                                    style: TextStyle(fontSize: 32,color: Config.app_backgroungColor),
                                    maxLength: 1,
                                    decoration: InputDecoration(hintText: 'M',counterText: "",border: InputBorder.none),
                                    keyboardType: TextInputType.number,
                                    onChanged: (t){
                                      text_4=t.toString();
                                      if(t.length==1){
                                        forthFocus.nextFocus();
                                      }
                                      if(t.length == 0){
                                        forthFocus.previousFocus();
                                      }
                                    },

                                  ),
                                ),


                                Container(
                                  width: 33,
                                  height: 60,
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    autofocus: true,
                                    maxLength: 1,
                                    enabled: false,
                                    style: TextStyle(fontSize: 32),
                                    decoration: InputDecoration(hintText: '/',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),

                                Container(
                                  width: 33,
                                  height: 60,
                                  child: TextFormField(
                                    focusNode:fifthFocus ,
                                    textInputAction: TextInputAction.next,
                                    autofocus: true,
                                    maxLength: 1,
                                    style: TextStyle(fontSize: 32,color: Config.app_backgroungColor),
                                    decoration: InputDecoration(hintText: 'Y',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,
                                    onChanged: (v){
                                      fifthFocus.nextFocus();
                                      if(v.length==1){

                                        text_5=v.toString();
                                      }
                                      if(v.length == 0){
                                        fifthFocus.previousFocus();
                                      }

                                    },
                                  ),
                                ),

                                Container(
                                  width: 33,
                                  height: 60,
                                  child: TextFormField(
                                    focusNode: sixthFocus,
                                    style: TextStyle(fontSize: 32,color: Config.app_backgroungColor),
                                    maxLength: 1,
                                    decoration: InputDecoration(hintText: 'Y',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,
                                    onChanged: (t){
                                      text_6=t.toString();
                                      if(t.length==1){
                                        sixthFocus.nextFocus();
                                      }
                                      if(t.length == 0){
                                        sixthFocus.previousFocus();
                                      }
                                    },

                                  ),
                                ),

                                Container(
                                  width: 33,
                                  height: 60,
                                  child: TextFormField(
                                    focusNode: seventhFocus,
                                    style: TextStyle(fontSize: 32,color: Config.app_backgroungColor),
                                    maxLength: 1,
                                    decoration: InputDecoration(hintText: 'Y',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,
                                    onChanged: (t){
                                      text_7=t.toString();
                                      if(t.length==1){
                                        seventhFocus.nextFocus();
                                      }
                                      if(t.length == 0){
                                        seventhFocus.previousFocus();
                                      }
                                    },

                                  ),
                                ),

                                Container(
                                  width: 33,
                                  height: 60,
                                  child: TextFormField(
                                    focusNode: eighthFocus,
                                    style: TextStyle(fontSize: 32,color: Config.app_backgroungColor),
                                    maxLength: 1,
                                    decoration: InputDecoration(hintText: 'Y',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,
                                    onChanged: (t){
                                      text_8=t.toString();
                                      if(t.length==1){
                                        changeColor();
                                        //eighthFocus.nextFocus();
                                      }
                                      if(t.length == 0){
                                        eighthFocus.previousFocus();
                                      }
                                    },

                                  ),
                                ),
                              ],
                            ),
                          )

                      ),
                      SizedBox(height: 100,),

                      GestureDetector(
                          onTap: (){
                            if(is_Completed){
                             checkFilles();
                            }
                           /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) => HomePage()));*/
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
      ),
    );
  }
  void checkFilles(){

    if(text_1.length>0 && text_2.length>0 && text_3.length>0 && text_4.length>0
        && text_5.length>0 && text_6.length>0 &&  text_7.length>0 &&  text_8.length>0){


      Config.Assessment_req['birthDay'] = text_1+text_2+"-"+text_3+text_4+"-"+text_5+text_6+text_7+text_8;
      
      if(widget.isEdit){
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>InformationSummaryScreen()));
      }
      else{
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => GenderQuestionScreen(false)));
      }

    }
    else{
      _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(
      "برجاء كتابة التاريخ صحيحاً", textAlign: TextAlign.right,
        style: TextStyle(fontFamily: 'Arabic'),)));
    }
  }
}
