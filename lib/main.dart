import 'package:fitmess/Pages/RegisterScreen.dart';
import 'package:fitmess/Pages/ResetPasswordScreen.dart';
import 'package:fitmess/Pages/SplachScreen.dart';
import 'package:fitmess/Pages/VerfiyPhoneNumberScreen.dart';
import 'package:fitmess/Pages/WelcomeScreen.dart';
import 'package:fitmess/localization/demo_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Models/JSONEmailPasswordModel.dart';
import 'localization/localization_constants.dart';

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

      
      home:SplachScreen() /*RegisterScreen(jsonEmailPasswordModel: new JSONEmailPasswordModel(ID: "2689",username: "201021957569",
          json_password: "ac8d2863431f1594ccd4c81eaa607f3b67",activationCode: "591664"))*/,
    );

  }
}

