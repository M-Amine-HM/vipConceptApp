import 'package:flutter/material.dart';
import 'package:localboss/features/home/repo/prefrences.dart';

class LanguageProvider with ChangeNotifier {
  Locale _locale = const Locale('de');

  Locale get locale => _locale;

  LanguageProvider() {
    Prefrences.getLanguage().then((lang) {
      print("getting language");
      print(lang);
      if(lang == "en"){
        _locale = const Locale('en');
        notifyListeners();
      }
      else if(lang == "de"){
        _locale = const Locale('de');
        notifyListeners();
      }
    });
  }

  void changeLocal(String lang){
    if(lang == "en"){
      _locale = const Locale('en');
    }
    else if(lang == "de"){
      _locale = const Locale('de');
    }

    notifyListeners();
  }
}