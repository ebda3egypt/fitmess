import 'dart:async';

import 'package:fitmess/DataRepositories/LoginService.dart';
import 'package:fitmess/DataRepositories/RegisterService.dart';
import 'package:fitmess/DataRepositories/activationPasswordService.dart';
import 'package:fitmess/DataRepositories/checkActivationCodeService.dart';
import 'package:fitmess/Enum/ActivationCodeEnum.dart';
import 'package:fitmess/Enum/RegisterEnum.dart';
import 'package:fitmess/Models/JSONEmailPasswordModel.dart';
import 'package:flutter/cupertino.dart';


class loginViewModel extends ChangeNotifier {

  LoginService _loginUser = new LoginService();
  ServiceEnum r_Condition=ServiceEnum.start;
  JSONEmailPasswordModel jsonEmailPasswordModel= new JSONEmailPasswordModel();
  String error_mess="";

  Future<void> loginUser(String phone, String password) async {
    if (_loginUser.connect_Condition != ServiceEnum.loading) {

      r_Condition = ServiceEnum.loading;
      notifyListeners();


      r_Condition = await  _loginUser.login_user(phone,password);
      error_mess=_loginUser.MyResponse;
      if(r_Condition==ServiceEnum.successfullyLoaded){
        print("done !");
        //jsonEmailPasswordModel = _registerUser.jsonEmailPasswordModel;
      }
      notifyListeners();
    }
    print("rCondition      :   ${r_Condition.toString()}");
    notifyListeners();
  }
}


