import 'dart:convert';
import 'package:fitmess/Enum/ActivationCodeEnum.dart';
import 'package:fitmess/Helpers/Config.dart';
import 'package:fitmess/Models/JSONEmailPasswordModel.dart';
import 'package:http/http.dart' as http;

class checkActivationCodeService{

  ActivationCodeEnum connect_Condition = ActivationCodeEnum.start;
  String MyResponse="";
  JSONEmailPasswordModel jsonEmailPasswordModel;


  Future<ActivationCodeEnum> check_activation_Code(String userPhone,String activationCode) async {
    print("userName  :   ${userPhone}   +   activationCode  :   ${activationCode}");
    if (connect_Condition != ActivationCodeEnum.loading) {

      final String apiUrl = Config.checkactivationCodeURL;
      print("activationUrl   :     "+apiUrl);

      connect_Condition = ActivationCodeEnum.loading;
      try{
        final response = await http.post(apiUrl, body: {
          "phone": userPhone,
          "activationCode": activationCode,
        });

        if (response.statusCode == 200) {
          Map<String,dynamic> ResponseJson = jsonDecode(response.body);
          print('resssssReeeeeeeegggggg: ${json.decode(response.body)}');
          if (ResponseJson.length > 0) {
            if(ResponseJson['Status'].toString()=="1"){
              jsonEmailPasswordModel = JSONEmailPasswordModel.fromJson(ResponseJson);
              connect_Condition= ActivationCodeEnum.successfullyLoaded;
              return connect_Condition;
            }
            else{
              MyResponse =ResponseJson["Errors"].toString();
              connect_Condition= ActivationCodeEnum.fail;
              return connect_Condition;
            }
          }
          else {
            connect_Condition= ActivationCodeEnum.fail;
            MyResponse="حدث خطأ";
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