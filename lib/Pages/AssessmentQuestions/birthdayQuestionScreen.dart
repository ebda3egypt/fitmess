import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';

class birthdayQuestionScreen extends StatefulWidget {
  @override
  _birthdayQuestionScreenState createState() => _birthdayQuestionScreenState();
}

class _birthdayQuestionScreenState extends State<birthdayQuestionScreen> {
  Config _config = Config();

  Color bu_color =Colors.grey[300] , bu_text_color = Colors.grey[600];
  bool is_Completed =false;
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
    bu_color = Colors.blue;
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
                        width: double.infinity,
                        child: Center(
                          child:Text(_config.get_text(context, "assessment_q1_txt"),textAlign: TextAlign.center,style: TextStyle(fontSize: 40),),
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
                                  width: 20,
                                  height: 100,
                                  child: TextFormField(
                                    focusNode: firstFocus,
                                    textInputAction: TextInputAction.next,
                                    autofocus: true,
                                    maxLength: 1,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(hintText: '0',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,
                                    onChanged: (v){
                                      if(v.length==1){
                                        firstFocus.nextFocus();
                                        // FocusScope.of(context).requestFocus(focus);
                                      }

                                    },
                                  ),
                                ),
                                Container(
                                  width: 20,
                                  height: 100,
                                  child: TextFormField(
                                    focusNode: secondFocus,
                                    style: TextStyle(fontSize: 20),
                                    maxLength: 1,
                                    decoration: InputDecoration(hintText: '0',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,
                                    onChanged: (t){
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
                                  width: 20,
                                  height: 100,
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    autofocus: true,
                                    maxLength: 1,
                                    enabled: false,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(hintText: '/',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,
                                    onChanged: (v){

                                    },
                                  ),
                                ),

                                Container(
                                  width: 20,
                                  height: 100,
                                  child: TextFormField(
                                    focusNode: thirdFocus,
                                    textInputAction: TextInputAction.next,
                                    autofocus: true,
                                    maxLength: 1,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(hintText: '0',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,
                                    onChanged: (v){
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
                                  width: 20,
                                  height: 100,
                                  child: TextFormField(
                                    focusNode: forthFocus,
                                    style: TextStyle(fontSize: 20),
                                    maxLength: 1,
                                    decoration: InputDecoration(hintText: '0',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,
                                    onChanged: (t){
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
                                  width: 20,
                                  height: 100,
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    autofocus: true,
                                    maxLength: 1,
                                    enabled: false,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(hintText: '/',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,
                                    onChanged: (v){

                                    },
                                  ),
                                ),

                                Container(
                                  width: 20,
                                  height: 100,
                                  child: TextFormField(
                                    focusNode:fifthFocus ,
                                    textInputAction: TextInputAction.next,
                                    autofocus: true,
                                    maxLength: 1,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(hintText: '0',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,
                                    onChanged: (v){
                                      if(v.length==1){
                                        fifthFocus.nextFocus();
                                      }
                                      if(v.length == 0){
                                        fifthFocus.previousFocus();
                                      }

                                    },
                                  ),
                                ),

                                Container(
                                  width: 20,
                                  height: 100,
                                  child: TextFormField(
                                    focusNode: sixthFocus,
                                    style: TextStyle(fontSize: 20),
                                    maxLength: 1,
                                    decoration: InputDecoration(hintText: '0',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,
                                    onChanged: (t){
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
                                  width: 20,
                                  height: 100,
                                  child: TextFormField(
                                    focusNode: seventhFocus,
                                    style: TextStyle(fontSize: 20),
                                    maxLength: 1,
                                    decoration: InputDecoration(hintText: '0',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,
                                    onChanged: (t){
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
                                  width: 20,
                                  height: 100,
                                  child: TextFormField(
                                    focusNode: eighthFocus,
                                    style: TextStyle(fontSize: 20),
                                    maxLength: 1,
                                    decoration: InputDecoration(hintText: '0',counterText: "",border: InputBorder.none,),
                                    keyboardType: TextInputType.number,
                                    onChanged: (t){
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
                      SizedBox(height: 50,),

                      GestureDetector(
                          onTap: ()async{
                           /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) => HomePage()));*/
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
      ),
    );
  }
}
