import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:covid19/localization/demo_localization.dart';

String getTranslated(BuildContext context, String key) {
  return DemoLocalizations.of(context).getTranslatedValue(key);
}

// language code
const String french = 'fr';
const String arabic = 'ar';

// Language code
const String LANGUAGE_CODE = 'LanguageCode';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);
  print(_locale(languageCode));
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale _temp;
  switch (languageCode) {
    case french:
      _temp = Locale(languageCode, 'FR');
      break;
    case arabic:
      _temp = Locale(languageCode, 'MA');
      break;
    default:
      _temp = Locale(arabic, 'MA');
  }
  return _temp;
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? arabic;

  return _locale(languageCode);
}
