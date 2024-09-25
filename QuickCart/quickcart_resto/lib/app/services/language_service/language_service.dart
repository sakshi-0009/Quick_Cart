import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/contains.dart';
import 'en.dart';

final class TranslationService extends Translations {
  static var fallbackLocale = const Locale('en', 'IN');

  static String localToString(Locale locale) {
    return "${locale.languageCode}-${locale.countryCode}";
  }

  static Locale localFromString(String text) {
    var code = text.split("-");
    return Locale(code.first, code.last);
  }

  static Future<Null> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lang = prefs.getString(LocalStorageKey.currentLanguage);
    if (lang != null && lang.isNotEmpty) {
      fallbackLocale = localFromString(lang);
    } else {
      fallbackLocale = fallbackLocale;
    }
    return null;
  }

  @override
  Map<String, Map<String, String>> get keys => {'en': en};


  static updateLocale(Locale locale) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Get.updateLocale(locale);
    fallbackLocale = locale;
    prefs.setString(LocalStorageKey.currentLanguage, localToString(locale));
  }

  static Map<String, String> lstLanguage = {
    'en': 'Drawer_Language_English'.tr,
  };
}
