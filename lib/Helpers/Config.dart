import 'package:fitmess/localization/localization_constants.dart';
import 'package:flutter/material.dart';

class Config{
  static String getactivationCodeURL="https://www.fitmessapp.com/include/webService.php?json=true&do=checkPhoneNumber";
  static String checkactivationCodeURL="https://www.fitmessapp.com/include/webService.php?json=true&do=appCheckActivationCode";
  static String WebServiceURL="https://www.fitmessapp.com/include/webService.php?json=true";
  static String LoginURL="https://www.fitmessapp.com/include/webService.php?json=true&do=SignIn";

  String get_text(var context ,String m_word){
    return get_translated(context,m_word);
  }
}