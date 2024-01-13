import 'package:flutter/material.dart';
import 'package:flutter_textmsg_fb_app/themes/dark_mode.dart';
import 'package:flutter_textmsg_fb_app/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
