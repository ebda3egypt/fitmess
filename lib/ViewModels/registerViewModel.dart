import 'dart:async';

import 'package:fitmess/DataRepositories/RegisterService.dart';
import 'package:fitmess/DataRepositories/activationPasswordService.dart';
import 'package:fitmess/DataRepositories/checkActivationCodeService.dart';
import 'package:fitmess/Enum/ActivationCodeEnum.dart';
import 'package:fitmess/Enum/RegisterEnum.dart';
import 'package:fitmess/Models/JSONEmailPasswordModel.dart';
import 'package:flutter/cupertino.dart';


class registerViewModel extends ChangeNotifier {

  RegisterService _registerUser = new RegisterService();
  ServiceEnum r_Condition=ServiceEnum.start;
  JSONEmailPasswordModel jsonEmailPasswordModel= new JSONEmailPasswordModel();
  String error_mess="";

  Future<void> registerNewUser(JSONEmailPasswordModel jsonEmailPasswordModel,String fname,String lname,String u_email,String password) async {
    if (_registerUser.connect_Condition != ActivationCodeEnum.loading) {

      r_Condition = ServiceEnum.loading;
      notifyListeners();


      r_Condition = await  _registerUser.register_new_user(jsonEmailPasswordModel,fname,lname,u_email,password);
      error_mess=_registerUser.MyResponse;
      if(r_Condition==ServiceEnum.successfullyLoaded){
        print("done !");
        //jsonEmailPasswordModel = _registerUser.jsonEmailPasswordModel;
      }
      notifyListeners();
    }
    print("rCondition      :   ${r_Condition.toString()}");
    //notifyListeners();
  }
}


