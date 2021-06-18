import 'package:flutter/cupertino.dart';

class Validator extends ChangeNotifier{


   String passwordMessage;
   String nameValidationMessage;

  String passwordValidator(String value){

     if(value.length<6){
        passwordMessage ="password field must contain atleast 6 characters";
        }
        notifyListeners();
        return passwordMessage;
        
  }

  // ignore: missing_return
  String usernameValidator(String value){
    if(value==null){
      notifyListeners();
          return "user field can't be empty";
        }
        return nameValidationMessage;
  }
}