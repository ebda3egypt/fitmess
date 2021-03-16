import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import 'package:fitmess/Widgets/AppBarWidget.dart';
import 'package:fitmess/Pages/AssessmentQuestions/InformationSummaryScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/fitnessLevelScreen.dart';

class goalWeightScreen extends StatefulWidget {
  bool isEdit;
  goalWeightScreen(this.isEdit);

  @override
  _goalWeightScreenState createState() => _goalWeightScreenState();
}

class _goalWeightScreenState extends State<goalWeightScreen> {
  Config _config = Config();
  Color bu_color =Colors.grey[300] , bu_text_color = Colors.grey[600] ;
  Color bu_color_amrican =Colors.grey[300] , bu_text_color_american = Colors.grey[600] ;
  Color bu_color_universal =Colors.blue , bu_text_color_universal = Colors.white ;

  String hintText = "";

  bool is_kg =false,is_Completed=false;
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
                          Text(_config.get_text(context,"assessment_headline3_txt").toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color:Colors.black))


                        ],

                      ),
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: double.infinity,
                          child: Center(
                            child:Text(_config.get_text(context, "weight_goal_txt"),textAlign: TextAlign.center,style: TextStyle(fontSize: 40),),
                          ),
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
                                  width: 50,
                                  height: 70,
                                  child: TextFormField(
                                    focusNode: firstFocus,
                                    textInputAction: TextInputAction.next,
                                    autofocus: true,
                                    maxLength: 3,
                                    style: TextStyle(fontSize: 20),
                                    decoration: InputDecoration(hintText: '000',counterText: "",border: InputBorder.none,hintStyle: TextStyle(color: Colors.grey[400])),
                                    keyboardType: TextInputType.number,
                                    onChanged: (v){
                                      if(v.length >= 3){
                                        changeColor();
                                      }
                                    },
                                  ),
                                ),



                              ],
                            ),
                          )

                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                  onTap: (){
                                    is_kg=true;
                                  },
                                  child: Container(
                                      child: LanguageSubmitButton(bu_text: _config.get_text(context,"weight_KG_unit_txt").toString(),bu_color: bu_color_universal ,textColor: bu_text_color_universal,))),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                  onTap: (){
                                    is_kg=false;
                                  },
                                  child: Container(
                                      child: LanguageSubmitButton(bu_text: _config.get_text(context,"weight_IB_unit_txt").toString().toString(),bu_color: bu_color_amrican ,textColor: bu_text_color_american,))),
                            ),
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
                                    builder: (BuildContext context) => fitnessLevelScreen(false)));
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