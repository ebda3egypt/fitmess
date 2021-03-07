import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import 'package:fitmess/Pages/HomePage.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatelessWidget {

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
          child:Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
            color: Colors.white,
            child: Center(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      height: 250,
                      child: Image.asset(
                        "assets/drawables/chooseLanguage.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10,),

                    Container(
                        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 60),
                        child: RichText(
                          text: new TextSpan(
                            style: new TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: _config.get_text(context,"welcom_txt")),
                              TextSpan(text: "Khaled", style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 26)),
                            ],
                          ),
                        )),
                    SizedBox(height: 30,),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 0,horizontal: 40),
                        child:Text(_config.get_text(context,"welcom_txt2").toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color:Colors.black))

                    ),
                    SizedBox(height: 20,),

                    GestureDetector(
                        onTap: ()async{
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (BuildContext context) => HomePage()));
                        },
                        child: Container(
                          margin:EdgeInsets.symmetric(vertical: 5,horizontal: 100),
                            child: LanguageSubmitButton(bu_text: _config.get_text(context,"welcom_bu_txt").toString(),bu_color: Colors.blue[800],textColor: Colors.white,))),


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
