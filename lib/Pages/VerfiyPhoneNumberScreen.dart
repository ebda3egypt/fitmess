import 'package:fitmess/Enum/ActivationCodeEnum.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Pages/RegisterScreen.dart';
import 'package:fitmess/ViewModels/checkActivationCodeViewModel.dart';
import 'package:fitmess/ViewModels/getActivationCodeViewModel.dart';
import 'package:fitmess/Widgets/LanguageSubmitButton.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:flutter/services.dart';

class VerifyPhoneNumberScreen extends StatelessWidget {
  String phoneNumber;
  String ComeFrom;
  VerifyPhoneNumberScreen({this.phoneNumber,this.ComeFrom});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context)=>checkActivationCodeViewModel()),
        Provider(create: (context)=>getActivationCodeViewModel()),
      ],
      child:VerifyPhoneNumberScreenClass(phoneNumber: phoneNumber,) ,
    );
  }
}
class VerifyPhoneNumberScreenClass extends StatelessWidget {

  String phoneNumber,ComeFrom;
  VerifyPhoneNumberScreenClass({this.phoneNumber,this.ComeFrom});

  Config _config = Config();
  String currentText;
  bool _onEditing;
  TextEditingController textEditingController = TextEditingController();
  final CountdownController controller = CountdownController();
  ActivationCodeEnum activationCodeEnum= ActivationCodeEnum.start;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isPause = true;
  bool _isRestart = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      //or set color with: Color(0xFF0000FF)
    ));

    activationCodeEnum = context.watch<checkActivationCodeViewModel>().r_Condition;

    if(activationCodeEnum == ActivationCodeEnum.successfullyLoaded){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => RegisterScreen(
            jsonEmailPasswordModel:Provider.of<checkActivationCodeViewModel>(context, listen: false).jsonEmailPasswordModel ,)));
    }
    else if (activationCodeEnum == ActivationCodeEnum.fail){
      _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(
        Provider.of<checkActivationCodeViewModel>(context, listen: false).error_mess, textAlign: TextAlign.right,
        style: TextStyle(fontFamily: 'Arabic'),)));
    }


    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: Center(
                    child: Text(_config.get_text(context, "verify_phone_txt"),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30),),
                  ),
                ),
                SizedBox(height: 50,),
                Text(_config.get_text(context, "verify_phone_txt2"),
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 17),),
                SizedBox(height: 20,),
                Text(phoneNumber, textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),),
                SizedBox(height: 20,),
                RichText(
                  text: new TextSpan(
                    style: new TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: _config.get_text(context, "verify_phone_txt3")),
                      TextSpan(
                          text: _config.get_text(context, "verify_phone_txt5"),
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 15)),
                    ],
                  ),
                ),
                SizedBox(height: 60,),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  useHapticFeedback: true,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    borderWidth: 1,
                    activeColor: Colors.grey[200],
                    activeFillColor: Colors.white,
                    inactiveColor: Colors.grey[400],
                    inactiveFillColor: Colors.white,
                    selectedColor: Colors.blue,
                    selectedFillColor: Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 200),
                  enableActiveFill: true,
                  controller: textEditingController,
                  onCompleted: (v) async{

                    if(ComeFrom=="NewUser"){
                      await Provider.of<checkActivationCodeViewModel>(context, listen: false).checkActivationCode(phoneNumber,v.toString());
                    }
                    else{

                    }




                  },
                  onChanged: (value) {
                    print(value);
                    currentText = value;
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: ()async{
                    await Provider.of<getActivationCodeViewModel>(context, listen: false).getActivationCode(phoneNumber);
                  },
                  child: RichText(
                    text: new TextSpan(
                      style: new TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: _config.get_text(context, "verify_phone_txt6")),

                        TextSpan(text: _config.get_text(context, "verify_phone_txt7"), style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 15)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_config.get_text(context, "verify_phone_txt8"),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),),
                    SizedBox(width: 10,),
                    Countdown(
                      controller: controller,
                      seconds: 900,
                      build: (_, double time) =>
                          Text(format(Duration(seconds:time.round())).toString(), style: TextStyle(fontSize: 15, color: Colors.blue,),
                          ),
                      interval: Duration(seconds: 1),
                      onFinished: () {
                        print('Timer is done!');
                        _isRestart = true;
                      },
                    ),
                    SizedBox(width: 10,),
                    Text(_config.get_text(context, "minute_txt"), textAlign: TextAlign.center, style: TextStyle(fontSize: 14),),
                  ],
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

format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

  String durationToString(int minutes) {
    var d = Duration(minutes:minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
  }