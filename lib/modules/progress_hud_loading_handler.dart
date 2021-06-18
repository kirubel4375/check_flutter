
import 'package:flutter/cupertino.dart';

class ProgressHudHandler extends ChangeNotifier{
  bool isLoading= false;
  void switchLoading(){
    isLoading=!isLoading;
    notifyListeners();
  }
}