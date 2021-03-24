import 'package:fitmess/Enum/RegisterEnum.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Models/JSONEmailPasswordModel.dart';
import 'package:fitmess/ViewModels/registerViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import 'package:provider/provider.dart';
import 'package:fitmess/Pages/WelcomeScreen.dart';
import 'dart:async';


class RegisterScreen extends StatelessWidget {
  JSONEmailPasswordModel jsonEmailPasswordModel;
  RegisterScreen({this.jsonEmailPasswordModel});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<registerViewModel>(
      create: (context)=>registerViewModel(),
      child:RegisterScreenClass(jsonEmailPasswordModel: jsonEmailPasswordModel,) ,
    );
  }
}


class RegisterScreenClass extends StatelessWidget {
  JSONEmailPasswordModel jsonEmailPasswordModel;
  RegisterScreenClass({this.jsonEmailPasswordModel});

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController _firstnameController=new TextEditingController();
  TextEditingController _lastnameController=new TextEditingController();
  TextEditingController _emailController=new TextEditingController();
  TextEditingController _passwordController=new TextEditingController();
  Config _config = Config();
  Color bt_color = Colors.grey[200],bt_txt_color = Colors.grey[600];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ServiceEnum serviceEnum = ServiceEnum.start;


  bool checkFills(){

    if(_firstnameController.text.toString().isNotEmpty &&  _lastnameController.text.toString().isNotEmpty
        &&_emailController.text.toString().isNotEmpty && _passwordController.text.toString().isNotEmpty)
    {
    if (_key.currentState.validate()) {
            return true;
        }
    else{
      return false;
    }
    }
    else{
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    serviceEnum = context.watch<registerViewModel>().r_Condition;

    if(serviceEnum == ServiceEnum.successfullyLoaded){
    /*  _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(
        "done", textAlign: TextAlign.right,
        style: TextStyle(fontFamily: 'Arabic'),)));*/
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => WelcomeScreen()));


    }
    else if (serviceEnum == ServiceEnum.fail)
    {
      _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(
        Provider.of<registerViewModel>(context, listen: false).error_mess, textAlign: TextAlign.right,
        style: TextStyle(fontFamily: 'Arabic'),)));
    }


    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 20),
            child: Form(
              key: _key,
              child: SingleChildScrollView(
                child: StatefulBuilder( builder: (BuildContext context, StateSetter setState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: double.infinity,
                          child: Text(_config.get_text(context, "Register_signup_txt"), textAlign: TextAlign.center, style: TextStyle(fontSize: 32),)),

                      SizedBox(height: 50,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_config.get_text(context, "Register_fname_txt"),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),),
                                SizedBox(height: 10,),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color:Colors.grey[400],width: 1),
                                  ),
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 15,color: Colors.black),
                                    decoration: InputDecoration.collapsed(
                                      hintText: _config.get_text(context, "Register_enter_name_txt"),
                                    ),
                                    onChanged: (v){
                                      if(checkFills()){
                                        bt_color = Config.app_backgroungColor;
                                        bt_txt_color= Colors.white;
                                        setState(() {});
                                      }
                                    },
                                    controller: _firstnameController,
                                    keyboardType: TextInputType.name,
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
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_config.get_text(context, "Register_lname_txt"),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),),
                                SizedBox(height: 10,),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color:Colors.grey[400],width: 1),
                                  ),
                                  child: TextFormField(
                                   style: TextStyle(fontSize: 15,color: Colors.black),
                                    decoration: InputDecoration.collapsed(
                                      hintText:_config.get_text(context, "Register_enter_name_txt"),
                                      /*  filled: true,
                                    isDense: true,*/
                                    ),
                                    controller: _lastnameController,
                                    keyboardType: TextInputType.name,
                                    autocorrect: false,
                                    onChanged: (v){
                                      if(checkFills()){
                                        bt_color = Config.app_backgroungColor;
                                        bt_txt_color= Colors.white;
                                        setState(() {});
                                      }
                                    },
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
                          ),

                        ],
                      ),

                      SizedBox(height: 30,),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_config.get_text(context, "Register_email_txt"),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),),
                          SizedBox(height: 10,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color:Colors.grey[400],width: 1),
                            ),
                            child: TextFormField(
                             style: TextStyle(fontSize: 15,color: Colors.black),
                              decoration: InputDecoration.collapsed(
                                hintText: _config.get_text(context, "Register_enter_email_txt"),
                              ),
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              onChanged: (v){

                                if(checkFills()){
                                  bt_color = Config.app_backgroungColor;
                                  bt_txt_color= Colors.white;
                                  setState(() {});
                                }
                              },
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
                          Text( _config.get_text(context, "Register_password_txt"),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),),
                          SizedBox(height: 10,),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color:Colors.grey[400],width: 1),
                            ),
                            child: TextFormField(
                             style: TextStyle(fontSize: 15,color: Colors.black),
                              decoration: InputDecoration.collapsed(
                                hintText: _config.get_text(context, "Register_enter_password_txt"),
                              ),
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              autocorrect: false,
                              onChanged: (v){
                                if(checkFills()){
                                  bt_color = Config.app_backgroungColor;
                                  bt_txt_color= Colors.white;
                                  setState(() {});
                                }
                              },
                              onEditingComplete: (){
                                print("onnn${checkFills().toString()}");
                                if(checkFills()){
                                  bt_color = Config.app_backgroungColor;
                                  bt_txt_color= Colors.white;
                                  setState(() {});
                                  print('hello 1');
                                }
                              },
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

                      serviceEnum == ServiceEnum.loading ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                        ],
                      ): GestureDetector(
                          onTap: ()async{
                            //bool t = checkFills();
                            if (_key.currentState.validate()) {
                            /*  await Provider.of<registerViewModel>(context, listen: false).registerNewUser(jsonEmailPasswordModel,
                                _firstnameController.text.toString(),_lastnameController.text.toString(),_emailController.text.toString(),_passwordController.text.toString());
*/

                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                  builder: (BuildContext context) => WelcomeScreen()));
                            }
                            else{
                              print("f");
                            }

                          },
                          child: LanguageSubmitButton(bu_text: _config.get_text(context, "Register_creat_account_txt"),bu_color: bt_color,textColor: bt_txt_color,)),

                    ],
                  );
                  }
                ),


              ),
            ),
          ),
        ),
      ),
    );
  }
}
