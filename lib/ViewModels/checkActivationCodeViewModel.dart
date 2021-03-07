import 'dart:async';

import 'package:fitmess/DataRepositories/activationPasswordService.dart';
import 'package:fitmess/DataRepositories/checkActivationCodeService.dart';
import 'package:fitmess/Enum/ActivationCodeEnum.dart';
import 'package:fitmess/Models/JSONEmailPasswordModel.dart';
import 'package:flutter/cupertino.dart';


class checkActivationCodeViewModel extends ChangeNotifier {

  checkActivationCodeService _checkActivaionCode = new checkActivationCodeService();
  ActivationCodeEnum r_Condition=ActivationCodeEnum.start;
  JSONEmailPasswordModel jsonEmailPasswordModel= new JSONEmailPasswordModel();
  String error_mess="";

  Future<void> checkActivationCode(String phone,String activation_code) async {
    if (_checkActivaionCode.connect_Condition != ActivationCodeEnum.loading) {

      r_Condition = ActivationCodeEnum.loading;
      notifyListeners();


      r_Condition = await  _checkActivaionCode.check_activation_Code(phone,activation_code);
      error_mess=_checkActivaionCode.MyResponse;
      if(r_Condition==ActivationCodeEnum.successfullyLoaded){
        jsonEmailPasswordModel = _checkActivaionCode.jsonEmailPasswordModel;
      }
      notifyListeners();
    }
    print("rCondition      :   ${r_Condition.toString()}");
    notifyListeners();
  }
}


