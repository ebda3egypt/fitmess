import 'package:flutter/material.dart';
import 'package:fitmess/Helpers/Config.dart';

class BodyNeedWidget extends StatelessWidget {
  Config _config = Config();
  String b_photo;
  String b_text;
  String b_amout;
  String b_unit;


  BodyNeedWidget({this.b_photo, this.b_text, this.b_amout, this.b_unit});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 150,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(b_photo),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_config.get_text(context,b_text).toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color:Colors.grey[400])),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(b_amout,textAlign: TextAlign.start,style: TextStyle(fontSize: 14,color:Colors.grey[800])),
                    SizedBox(width: 5,),
                    Text(_config.get_text(context,b_unit).toString(),textAlign: TextAlign.start,style: TextStyle(fontSize: 14,color:Colors.grey[800])),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
