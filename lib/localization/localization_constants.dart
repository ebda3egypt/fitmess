import 'package:fitmess/localization/demo_localization.dart';
import 'package:flutter/material.dart';

String get_translated(BuildContext context,String word_txt){
  return DemoLocalizations.of(context).getTranslatedValue(word_txt);
}

