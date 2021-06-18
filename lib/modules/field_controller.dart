import 'package:flutter/cupertino.dart';

class FieldController extends ChangeNotifier{
  String email;
  String password;

  void setEmail(String value){
    email=value;
    notifyListeners();
  }
  void setPassword(String value){
    password=value;
    notifyListeners();
  }

}