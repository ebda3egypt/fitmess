import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import 'package:fitmess/Widgets/BodyNeedWidget.dart';
import 'package:fitmess/Pages/HomePage.dart';
import 'package:flutter/services.dart';


class BodyNeedsScreen extends StatelessWidget {

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
        body: Padding(
          padding: const EdgeInsets.only(top:20),
          child:SingleChildScrollView(
            child:Container(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
              color: Colors.white,
              child: Center(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(_config.get_text(context,"body_needs_headline_1").toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color:Colors.black)),
                              Image.asset("assets/drawables/ic_strong.png"),
                            ],
                          )

                      ),

                      SizedBox(height: 10,),

                      Container(
                          margin: EdgeInsets.symmetric(vertical: 0,horizontal: 40),
                          child:Text(_config.get_text(context,"body_needs_headline_2").toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color:Colors.grey[800]))

                      ),
                      SizedBox(height: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BodyNeedWidget(b_photo: "assets/drawables/ic_cal.png",b_text:"calories_text" ,b_amout:"2200" ,b_unit:"cal_text" ,),
                          BodyNeedWidget(b_photo: "assets/drawables/ic_protein.png",b_text:"protein_text" ,b_amout:"140" ,b_unit:"gm_text" ,),
                          BodyNeedWidget(b_photo: "assets/drawables/ic_fat.png",b_text:"fat_text" ,b_amout:"48" ,b_unit:"gm_text" ,),
                          BodyNeedWidget(b_photo: "assets/drawables/ic_carbs.png",b_text:"carbs_text" ,b_amout:"185" ,b_unit:"cal_text" ,),

                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          child: RichText(
                            text: new TextSpan(
                              style: new TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(text: _config.get_text(context,"body_needs_text_1")),
                                TextSpan(text: "0.5 ", style: new TextStyle(color: Colors.blue,fontSize: 18)),
                                TextSpan(text:  _config.get_text(context,"weight_KG_unit_txt")+"  ", style: new TextStyle(color: Colors.blue,fontSize: 18)),
                                TextSpan(text:  _config.get_text(context,"body_needs_text_2"),),
                              ],
                            ),
                          )),

                      SizedBox(height: 10,),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 0,horizontal: 40),
                          child:Text(_config.get_text(context,"body_needs_text_3").toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color:Colors.black))

                      ),
                      SizedBox(height: 30,),

                      GestureDetector(
                          onTap: ()async{
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) => HomePage()));
                          },
                          child: Container(
                              margin:EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                              child: LanguageSubmitButton(bu_text: _config.get_text(context,"start_text").toString(),bu_color: Colors.blue[800],textColor: Colors.white,))),


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
