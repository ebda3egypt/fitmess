class JSONEmailPasswordModel{
  String ID;
  String username;
  String json_password;
  String activationCode;

  JSONEmailPasswordModel(
  {this.ID, this.username, this.json_password, this.activationCode});

  factory JSONEmailPasswordModel.fromJson(Map<String,dynamic>ResponseJson){
    return JSONEmailPasswordModel(
      ID: ResponseJson["Result"]['ID'].toString(),
      username: ResponseJson["Result"]['username'].toString(),
      json_password:ResponseJson["Result"]['json_password'].toString() ,
      activationCode: ResponseJson["Result"]['password'].toString(),
    );
  }
}