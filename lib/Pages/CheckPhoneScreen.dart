import 'package:fitmess/DataRepositories/checkActivationCodeService.dart';
import 'package:fitmess/Enum/ActivationCodeEnum.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Models/IntroductionModel.dart';
import 'package:fitmess/Pages/LoginScreen.dart';
import 'package:fitmess/Pages/VerfiyPhoneNumberScreen.dart';
import 'package:fitmess/ViewModels/getActivationCodeViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';


class CheckPhoneScreen extends StatelessWidget {
    String ComeFrom = "";
    CheckPhoneScreen(this.ComeFrom);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<getActivationCodeViewModel>(
        create: (context)=>getActivationCodeViewModel(),
        child:CheckPhoneScreenClass(ComeFrom) ,
    );
  }
}


class CheckPhoneScreenClass extends StatelessWidget {

  String ComeFrom = "";
  CheckPhoneScreenClass(this.ComeFrom);


  Config _config = Config();
  String phoneNumber;
  String phoneIsoCode='+20';
  bool visible = false;
  String confirmedNumber = '';
  ActivationCodeEnum activationCodeEnum=ActivationCodeEnum.start;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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

    activationCodeEnum = context.watch<getActivationCodeViewModel>().r_Condition;
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
                    child:Text(_config.get_text(context, "check_phone_text"),textAlign: TextAlign.center,style: TextStyle(fontSize: 30),),
                  ),
                ),
                SizedBox(height: 50,),
                Text(_config.get_text(context, "check_phone_textfield"),),
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
                RichText(
                  text: new TextSpan(
                    style: new TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: _config.get_text(context,"check_phone_terms")),
                      TextSpan(text: _config.get_text(context,"check_phone_terms2"), style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 18)),
                      TextSpan(text: _config.get_text(context,"check_phone_terms3")),
                      TextSpan(text: _config.get_text(context,"check_phone_terms4"), style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 18)),
                    ],
                  ),
                ),
                SizedBox(height: 100,),

                activationCodeEnum == ActivationCodeEnum.loading ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ) : GestureDetector(
                 onTap: ()async{
                   String m_phone= "2${phoneNumber}";
                   await Provider.of<getActivationCodeViewModel>(context, listen: false).getActivationCode(m_phone);
                   if(activationCodeEnum == ActivationCodeEnum.successfullyLoaded){
                     Navigator.of(context).push(MaterialPageRoute(
                         builder: (BuildContext context) => VerifyPhoneNumberScreen(phoneNumber:m_phone,ComeFrom:ComeFrom)));
                   }
                   else{
                     _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(
                       Provider.of<getActivationCodeViewModel>(context, listen: false).error_mess, textAlign: TextAlign.right,
                       style: TextStyle(fontFamily: 'Arabic'),)));
                   }
                 },
                   child: LanguageSubmitButton(bu_text: _config.get_text(context,"check_phone_button_text"),bu_color: Colors.blue[800],textColor: Colors.white,)),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => LoginScreen()));
                  },
                  child: RichText(
                    text: new TextSpan(
                      style: new TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: _config.get_text(context,"already_have_acount")),
                        TextSpan(text: _config.get_text(context,"already_have_acount2"), style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 18)),
                      ],
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
