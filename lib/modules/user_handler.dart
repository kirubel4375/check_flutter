import 'package:flutter/material.dart';

class UserHandler extends ChangeNotifier{
  String username;
  String password;
  String confimPassword;

  void setEmail(String emailText){
    username=emailText;
    notifyListeners();
  }
  void setPassword(String passwordText){
    password=passwordText;
    notifyListeners();
  }
  void setConfirmPassword(String confirmText){
    confimPassword= confirmText;
    notifyListeners();
  }
}