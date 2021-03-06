import 'package:fitmess/Enum/ActivationCodeEnum.dart';
import 'package:fitmess/Enum/RegisterEnum.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/ViewModels/loginViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:provider/provider.dart';
import 'package:fitmess/Pages/CheckPhoneScreen.dart';
import 'package:flutter/services.dart';
import 'package:fitmess/Pages/AssessmentQuestions/birthdayQuestionScreen.dart';


class LoginScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<loginViewModel>(
      create: (context)=>loginViewModel(),
      child:LoginScreenClass() ,
    );
  }
}

class LoginScreenClass extends StatelessWidget {
  Config _config = Config();
  String phoneNumber;
  String phoneIsoCode='+20';
  bool visible = false;
  String confirmedNumber = '';
  ServiceEnum Loginenum=ServiceEnum.start;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _passwordController=new TextEditingController();

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    phoneNumber = number;
    phoneIsoCode = isoCode;
  }

  onValidPhoneNumber(
      String number, String internationalizedPhoneNumber, String isoCode) {

    visible = true;
    confirmedNumber = internationalizedPhoneNumber;
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      //or set color with: Color(0xFF0000FF)
    ));



    Loginenum = context.watch<loginViewModel>().r_Condition;



    print("check serv = ${Loginenum.toString()}");
    if(Loginenum == ServiceEnum.successfullyLoaded){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => birthdayQuestionScreen(false)));
     /* Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => HomePage()));*/
    }
    else if (Loginenum == ServiceEnum.fail){
      _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(
        Provider.of<loginViewModel>(context, listen: false).error_mess, textAlign: TextAlign.right,
        style: TextStyle(fontFamily: 'Arabic'),)));
    }

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child:Padding(
          padding: EdgeInsets.only(top: 30,left: 20,right: 20,bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Center(
                    child:Text(_config.get_text(context, "Login_txt"),textAlign: TextAlign.center,style: TextStyle(fontSize: 32),),
                  ),
                ),
                SizedBox(height: 50,),
                Text(_config.get_text(context, "check_phone_textfield"),style: TextStyle(fontSize: 15),),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color:Colors.grey[400],width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: InternationalPhoneInput(
                    decoration: InputDecoration.collapsed(hintText: '1x xxxx xxxx'),
                    onPhoneNumberChange: onPhoneNumberChange,
                    initialPhoneNumber: phoneNumber,
                    initialSelection: phoneIsoCode,
                    enabledCountries: ['+20','+966','+971'],
                    showCountryCodes: true,
                    showCountryFlags: true,
                  ),
                ),
                SizedBox(height: 20,),
                Text(_config.get_text(context, "Register_password_txt"),style: TextStyle(fontSize: 15),),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color:Colors.grey[400],width: 1),
                  ),
                  child: TextFormField(
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration.collapsed(
                      hintText:_config.get_text(context, "Register_enter_password_txt") ,
                    ),
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    autocorrect: false,
                    validator: (text){
                      if(text.toString().isEmpty)
                      {
                        return"Enter Your Password";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 50,),

                Loginenum == ServiceEnum.loading ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ) : GestureDetector(
                    onTap: ()async{

                      String m_phone= "2${phoneNumber}";

                      if(_passwordController.text.toString().length>0){
                        await Provider.of<loginViewModel>(context, listen: false).loginUser(m_phone,_passwordController.text.toString());


                      }
                    },
                    child: LanguageSubmitButton(bu_text: _config.get_text(context,"Login_txt_bu"),bu_color: Config.app_backgroungColor,textColor: Colors.white,)),


                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:12.0),
                  child: RichText(
                    text: new TextSpan(
                      style: new TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontFamily: 'Arabic',
                      ),
                      children: <TextSpan>[
                        TextSpan(text: _config.get_text(context,"Login_txt_not_remeber"),style: TextStyle(fontFamily: 'Arabic')),
                        TextSpan(text: _config.get_text(context,"Login_txt_reset"), style: new TextStyle(fontFamily: 'Arabic',fontWeight: FontWeight.bold,color: Config.app_backgroungColor,fontSize: 18)),

                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:12.0),
                  child:GestureDetector (
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => CheckPhoneScreen("NewUser")));
                    },
                    child: RichText(
                      text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontFamily: 'Arabic',
                        ),
                        children: <TextSpan>[
                          TextSpan(text: _config.get_text(context,"Login_txt_reg_1"),style: TextStyle(fontFamily: 'Arabic')),
                          TextSpan(text: _config.get_text(context,"Login_txt_reg_2"), style: new TextStyle(fontFamily: 'Arabic',fontWeight: FontWeight.bold,color: Config.app_backgroungColor,fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
