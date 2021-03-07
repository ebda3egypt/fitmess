import 'dart:async';

import 'package:fitmess/DataRepositories/activationPasswordService.dart';
import 'package:fitmess/DataRepositories/checkActivationCodeService.dart';
import 'package:fitmess/Enum/ActivationCodeEnum.dart';
import 'package:fitmess/Models/JSONEmailPasswordModel.dart';
import 'package:flutter/cupertino.dart';


class getActivationCodeViewModel extends ChangeNotifier {

  activationCodeService _getActivaionCode = new activationCodeService();
  ActivationCodeEnum r_Condition=ActivationCodeEnum.start;
  String error_mess="";

  Future<void> getActivationCode(String phone) async {
    if (_getActivaionCode.connect_Condition != ActivationCodeEnum.loading) {

      r_Condition = ActivationCodeEnum.loading;
      notifyListeners();


      r_Condition = await  _getActivaionCode.get_activation_code(phone);
      error_mess=_getActivaionCode.MyResponse;
      notifyListeners();
    }
    print("rCondition      :   ${r_Condition.toString()}");
    notifyListeners();
  }
}


