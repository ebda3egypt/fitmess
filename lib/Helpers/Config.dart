import 'package:fitmess/localization/localization_constants.dart';
import 'package:flutter/material.dart';

class Config{
  static String getactivationCodeURL="https://www.fitmessapp.com/include/webService.php?json=true&do=checkPhoneNumber";
  static String checkactivationCodeURL="https://www.fitmessapp.com/include/webService.php?json=true&do=appCheckActivationCode";
  static String WebServiceURL="https://www.fitmessapp.com/include/webService.php?json=true";
  static String LoginURL="https://www.fitmessapp.com/include/webService.php?json=true&do=SignIn";
  static Color app_backgroungColor = Color(int.parse("FF1BAAF7",radix: 16));
  static Color app_light_grey = Color(int.parse("FFEDF7FC",radix: 16));


  String get_text(var context ,String m_word){
    return get_translated(context,m_word);
  }


  int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}