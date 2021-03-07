import 'package:flutter/material.dart';

class LanguageSubmitButton extends StatelessWidget {

  String bu_text;
  Color bu_color;
  Color textColor;
  LanguageSubmitButton({this.bu_text,this.bu_color,this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: bu_color,
          borderRadius: BorderRadius.all(Radius.circular(5)),
         ),
      child: Text(
        bu_text,
        style: TextStyle(
            fontSize: 15, color: textColor, fontFamily: 'Arabic'),
      ),
    );
  }
}
