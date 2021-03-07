import 'dart:convert';

import 'package:fitmess/Enum/ActivationCodeEnum.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Models/JSONEmailPasswordModel.dart';
import 'package:http/http.dart' as http;




class activationCodeService{
  ActivationCodeEnum connect_Condition = ActivationCodeEnum.start;
  String MyResponse="";
  String ID,user_name,json_password,act_code;
  Future<ActivationCodeEnum> get_activation_code(String userPhone) async {

    print("userName  :   ${userPhone}");

    if (connect_Condition != ActivationCodeEnum.loading) {

      final String apiUrl = Config.getactivationCodeURL;

      print("activationUrl   :     "+apiUrl);

      connect_Condition = ActivationCodeEnum.loading;
      try{
        final response = await http.post(apiUrl, body: {
          "phone": userPhone,
        });

        if (response.statusCode == 200) {
          Map<String,dynamic> ResponseJson = jsonDecode(response.body);
          print('resssssReeeeeeeegggggg: ${json.decode(response.body)}');
          if (ResponseJson['Status'].toString()=="1") {
            connect_Condition = ActivationCodeEnum.successfullyLoaded;
            return connect_Condition;
          }
          else{
            MyResponse =ResponseJson["Errors"].toString();
            connect_Condition= ActivationCodeEnum.fail;
            return connect_Condition;
          }
        }
      }
      catch(ex){
        print("RecievingactivationCode :   ${ex.toString()}");
        connect_Condition= ActivationCodeEnum.fail;
        MyResponse="حدث خطأ";
        return connect_Condition;

      }
    }
    else
    {
      connect_Condition= ActivationCodeEnum.fail;
      MyResponse="حدث خطأ";
      return connect_Condition;
    }

  }
}