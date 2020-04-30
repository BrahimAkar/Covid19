import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DemoLocalizations {
  final Locale local;

  DemoLocalizations(this.local);
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  Map<String, String> _localizedValues;

  Future load() async {
    String jsonStringValues =
        await rootBundle.loadString("lib/lang/${local.languageCode}.json");
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslatedValue(String key) {
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<DemoLocalizations> delegate =
      _DemoLocalistationDelegate();
}

class _DemoLocalistationDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const _DemoLocalistationDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['ar', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalizations> load(Locale locale) async {
    DemoLocalizations localization = new DemoLocalizations(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(_DemoLocalistationDelegate old) => false;
}
