import 'package:fitmess/Helpers/Config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';

class ResetPasswordScreen extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _confirmnewpasswordController;
  TextEditingController _newpasswordController;
  Config _config = Config();
  Color bt_color = Colors.grey[300],bt_txt_color = Colors.grey[600];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  bool checkFills(){
    if (_key.currentState.validate()) {
      return true;
    }
    else{
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {

    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 20),
            child: Form(
              key: _key,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: double.infinity,
                        child: Text(_config.get_text(context, "Register_reset_pass_txt"), textAlign: TextAlign.center, style: TextStyle(fontSize: 35),)),

                    SizedBox(height: 50,),


                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_config.get_text(context, "Register_reset_newpass_txt"),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),),
                        SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color:Colors.grey[400],width: 1),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration.collapsed(
                              hintText: _config.get_text(context, "Register_reset_enternewpass_txt"),
                            ),
                            controller: _newpasswordController,
                            keyboardType: TextInputType.text,
                            autocorrect: false,
                            obscureText: true,
                            validator: (text){
                              if(text.toString().isEmpty)
                              {
                                return"";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 30,),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( _config.get_text(context, "Register_reset_confirmpass_txt"),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),),
                        SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color:Colors.grey[400],width: 1),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration.collapsed(
                              hintText: _config.get_text(context, "Register_reset_confirnewpass_txt"),
                            ),
                            controller: _confirmnewpasswordController,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            autocorrect: false,
                            validator: (text){
                              if(text.toString().isEmpty)
                              {
                                return"";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 50,),

                    GestureDetector(
                        onTap: (){
                          //bool t = checkFills();
                          if (_key.currentState.validate()) {
                            print("T");
                          }
                          else{
                            print("f");
                          }

                        },
                        child: LanguageSubmitButton(bu_text: _config.get_text(context, "Register_reset_pass_txt"),bu_color: bt_color,textColor: bt_txt_color,)),

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