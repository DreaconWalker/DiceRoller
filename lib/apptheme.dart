import 'package:flutter/material.dart';

AppTheme customTheme = AppTheme();

class AppTheme with ChangeNotifier {
  static bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get theme1 {
    return ThemeData(
      primaryColor: Color(0xffbca099),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Patrick',
      buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          buttonColor: Color(0xffc3a5cf)),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: Color(0xff0c343d),
        scaffoldBackgroundColor: Colors.black,
        textTheme: ThemeData.dark().textTheme,
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Color(0xff541417),
        ));
  }
}
