import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class CustomTheme with ChangeNotifier{

  bool isDarkMode= Hive.box('storage').get('isDarkMode')?? false;

  ThemeMode get currentTheme => isDarkMode? ThemeMode.dark: ThemeMode.light;

  void toggleDarkMode(){
    isDarkMode = !isDarkMode;
    notifyListeners();
    Hive.box('storage').put('isDarkMode', isDarkMode);
  }

  static ThemeData get lightTheme{
    return ThemeData(
      primaryColor: Colors.blueGrey,
      accentColor: Colors.blueAccent,
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black),
        button: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
      ),
    );
  }
  static ThemeData get darkTheme{
    return  ThemeData(
      accentColor: Colors.redAccent,
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        button: TextStyle(color: Colors.white70),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
      ),
    );
  }

}