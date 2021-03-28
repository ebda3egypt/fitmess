import 'package:fitmess/Pages/BodyMeasurement/leftArmSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import 'package:fitmess/Widgets/AppBarWidget.dart';
import 'package:fitmess/Pages/AssessmentQuestions/slideWeightScreen.dart';
import 'package:fitmess/Pages/AssessmentQuestions/InformationSummaryScreen.dart';

class leftThighScreen extends StatefulWidget {
  bool isEdit;
  leftThighScreen(this.isEdit);
  @override
  _leftThighScreenState createState() => _leftThighScreenState();
}

class _leftThighScreenState extends State<leftThighScreen> {
  Config _config = Config();
  Color bu_color =Colors.grey[300] , bu_text_color = Colors.grey[600] ;
  Color bu_color_amrican =Colors.grey[300] , bu_text_color_american = Colors.grey[600] ;
  Color bu_color_universal =Config.app_backgroungColor , bu_text_color_universal = Colors.white ;

  String hintText = "",weight_txt="";

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
    bu_color = Config.app_backgroungColor;
    bu_text_color = Colors.white;
    setState(() {});
  }

  void changeButton(){
    if(is_kg){
      bu_color_amrican =Colors.grey[300] ;
      bu_text_color_american = Colors.grey[600] ;
      bu_color_universal =Config.app_backgroungColor ;
      bu_text_color_universal = Colors.white ;
    }
    else{
      bu_color_universal=Colors.grey[300] ;
      bu_text_color_universal = Colors.grey[600] ;
      bu_color_amrican=Config.app_backgroungColor;
      bu_text_color_american= Colors.white ;
    }

    setState(() {

    });

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
        body:Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
          color: Colors.white,
          child: Center(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 50),
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
                            Text("(8/8)",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color:Colors.black)),
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
                          child:Text(_config.get_text(context, "left_thigh_size_q"),textAlign: TextAlign.center,style: TextStyle(fontSize: 32),),
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
                                width: 80,
                                height: 70,
                                child: TextFormField(
                                  focusNode: firstFocus,
                                  textInputAction: TextInputAction.next,
                                  autofocus: true,
                                  maxLength: 2,
                                  style: TextStyle(fontSize: 32,color:Config.app_backgroungColor),
                                  decoration: InputDecoration(hintText: '00',counterText: "",border: InputBorder.none,hintStyle: TextStyle(color: Colors.grey[400])),
                                  keyboardType: TextInputType.number,
                                  onChanged: (v){
                                    weight_txt=v;
                                    if(v.length >= 2){
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
                                  changeButton();
                                },
                                child: Container(
                                    child: LanguageSubmitButton(bu_text: _config.get_text(context,"height_universal_unit_txt").toString(),bu_color: bu_color_universal ,textColor: bu_text_color_universal,))),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                                onTap: (){
                                  is_kg=false;
                                  changeButton();
                                },
                                child: Container(
                                    child: LanguageSubmitButton(bu_text: _config.get_text(context,"height2_american_unit_txt").toString().toString(),bu_color: bu_color_amrican ,textColor: bu_text_color_american,))),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 80,),

                    GestureDetector(
                        onTap: ()async{
                          if(is_Completed){

                            if(is_kg){
                              Config.Assessment_req['isKG'] = "y";
                              Config.Assessment_req['Weight'] = weight_txt;
                            }
                            else{
                              Config.Assessment_req['isKG'] = "n";
                              Config.Assessment_req['Weight'] = weight_txt;
                            }

                            if(widget.isEdit){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                  builder: (BuildContext context) =>InformationSummaryScreen()));
                            }
                            else{
                              /*Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => leftArmSizeScreen(false)));*/
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
