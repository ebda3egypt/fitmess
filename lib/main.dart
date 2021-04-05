import 'package:fitmess/Pages/AssessmentQuestions/birthdayQuestionScreen.dart';
import 'package:fitmess/Pages/BodyMeasurement/neckSizeScreen.dart';
import 'package:fitmess/Pages/SplachScreen.dart';
import 'package:fitmess/Pages/WelcomeScreen.dart';
import 'package:fitmess/Pages/introductionScreen.dart';
import 'package:fitmess/Pages/RegisterScreen.dart';
import 'package:fitmess/Pages/ResetPasswordScreen.dart';
import 'package:fitmess/Pages/VerfiyPhoneNumberScreen.dart';
import 'package:fitmess/Models/JSONEmailPasswordModel.dart';

import 'package:fitmess/localization/demo_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  static void setLocale(BuildContext context,Locale locale){
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  void setLocale(Locale locale){
    setState(() {
      _locale =locale;
    });

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ar', ''),
      ],
      locale: _locale,
      localizationsDelegates: [
        DemoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale,supportedLocales){
        for(var locale in supportedLocales){
            if(locale.languageCode == deviceLocale.languageCode)
              return deviceLocale;
        }

        return supportedLocales.first;
      },
      title: 'fitmess',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arabic',
        backgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      
      home:introductionScreen()/*SplachScreen()*//*neckSizeScreen(false)*//*birthdayQuestionScreen(false)*//* RegisterScreen(jsonEmailPasswordModel: new JSONEmailPasswordModel(ID: "2689",username: "201062780652",
          json_password: "1da1644a89d84da276f68046b9bcac68fc",activationCode: "925586"))*/,
    );
  }
}

