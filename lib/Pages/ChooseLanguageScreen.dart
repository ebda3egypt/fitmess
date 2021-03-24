import 'package:fitmess/Enum/LanguageEnum.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import 'package:fitmess/localization/localization_constants.dart';
import 'package:fitmess/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'introductionScreen.dart';

class ChooseLanguageScreen extends StatelessWidget {
  Color ar_bu_color=Colors.grey[200],ar_text_color=Colors.black,word_color_ar= Colors.black;
  Color en_bu_color = Colors.grey[200],en_text_color=Colors.black;
  LanguageEnum SelectedLang = LanguageEnum.none;


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      //or set color with: Color(0xFF0000FF)
    ));


    String confirmText =  get_translated(context,"confirmtext");
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 40,bottom: 20,left: 20,right: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      "assets/drawables/chooseLanguage.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(

                      child: Text(get_translated(context,"chooseLanText"),textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color:Colors.black))
                  ),
                  SizedBox(height: 20,),
                  
                  StatefulBuilder( builder: (BuildContext context, StateSetter setState) {
                    return Column(
                      children: [
                        GestureDetector(
                            onTap: (){
                              setState(() {
                                if(SelectedLang == LanguageEnum.en){
                                  en_bu_color = Colors.grey[200];
                                  en_text_color=Colors.black;
                                  SelectedLang=LanguageEnum.none;
                                }
                                else{
                                  en_bu_color=Config.app_backgroungColor;
                                  en_text_color=Colors.white;
                                  ar_bu_color=Colors.grey[200];
                                  ar_text_color=Colors.black;
                                  SelectedLang=LanguageEnum.en;
                                }

                              });
                            },
                            child: LanguageSubmitButton(bu_text: "English",bu_color: en_bu_color,textColor: en_text_color,)),

                        SizedBox(height: 20,),

                        GestureDetector(
                            onTap: (){
                              setState(() {
                                if(SelectedLang == LanguageEnum.ar){
                                  ar_bu_color=Colors.grey[200];
                                  ar_text_color=Colors.black;
                                  SelectedLang=LanguageEnum.none;
                                }
                                else{
                                  ar_bu_color=Config.app_backgroungColor;
                                  ar_text_color=Colors.white;
                                  en_bu_color = Colors.grey[200];
                                  en_text_color=Colors.black;
                                  SelectedLang=LanguageEnum.ar;
                                }

                              });
                            },
                            child: LanguageSubmitButton(bu_text: "العربية",bu_color: ar_bu_color,textColor: ar_text_color,)),
                      ],
                    );
                  }),

                  SizedBox(height: 20,),
                  GestureDetector(

                    onTap: (){
                      String m_lan;
                      if(SelectedLang == LanguageEnum.ar){
                        m_lan="ar";
                      }
                      else
                      {
                        m_lan="en";
                      }
                      ;
                      MyApp.setLocale(context, Locale(m_lan));
                      if(SelectedLang != LanguageEnum.none){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => introductionScreen()));
                      }

                    },
                      child: LanguageSubmitButton(bu_text:confirmText,bu_color: Config.app_backgroungColor,textColor: Colors.white,)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
