import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoLocalizations {
  final Locale localeName;
  DemoLocalizations(this.localeName);

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  Map<String,String> _localizedValues;

  Future Load()async{
    String jsonFileValues = await rootBundle.loadString("assets/languages/${localeName.languageCode}.json");
    Map<String,dynamic> mappedJson = json.decode(jsonFileValues);

    _localizedValues = mappedJson.map((key, value) => MapEntry(key, value));
  }

  String getTranslatedValue (String key)
  {
    return _localizedValues[key];
  }
  static const LocalizationsDelegate<DemoLocalizations> delegate = _DemoLocalizationsDelegate();
}

class _DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
  const _DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en','ar'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalizations> load(Locale locale) async {
   DemoLocalizations localization = new DemoLocalizations(locale);
   await localization.Load();
   return localization;
  }

  @override
  bool shouldReload(_DemoLocalizationsDelegate old) => false;
}

