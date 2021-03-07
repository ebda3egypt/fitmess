import 'dart:convert';

import 'package:fitmess/Enum/ActivationCodeEnum.dart';
import 'package:fitmess/Enum/RegisterEnum.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Models/JSONEmailPasswordModel.dart';
import 'package:http/http.dart' as http;




class RegisterService{

  ServiceEnum connect_Condition = ServiceEnum.start;
  String MyResponse="";



  Future<ServiceEnum> register_new_user(JSONEmailPasswordModel jsonEmailPasswordModel,String fname,String lname,String u_email,String password) async {



    if (connect_Condition != ActivationCodeEnum.loading) {

      final String apiUrl = Config.WebServiceURL;

      print("activationUrl   :     "+apiUrl);

      connect_Condition = ServiceEnum.loading;
      try{
        final response = await http.post(apiUrl, body: {
          "do": "updateProfile",
          "firstName": fname,
          "lastName": lname,
          "newPassword": password,
          "newEmail":u_email,
          "json_email": jsonEmailPasswordModel.username.toString(),
          "json_password": jsonEmailPasswordModel.json_password.toString(),
        });

        if (response.statusCode == 200) {
          Map<String,dynamic> ResponseJson = jsonDecode(response.body);
          print('resssssReeeeeeeegggggg: ${json.decode(response.body)}');
          if (ResponseJson['Status'].toString()=="1") {
            connect_Condition = ServiceEnum.successfullyLoaded;
            return connect_Condition;
          }
          else{
            MyResponse =ResponseJson["Errors"].toString();
            connect_Condition= ServiceEnum.fail;
            return connect_Condition;
          }
        }
      }
      catch(ex){
        print("RecievingactivationCode :   ${ex.toString()}");
        connect_Condition= ServiceEnum.fail;
        MyResponse="حدث خطأ";
        return connect_Condition;

      }
    }
    else
    {
      connect_Condition= ServiceEnum.fail;
      MyResponse="حدث خطأ";
      return connect_Condition;
    }

  }
}