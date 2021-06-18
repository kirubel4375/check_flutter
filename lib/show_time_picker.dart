


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePicker extends ChangeNotifier{

    int selectedHour;
  int selectedMinute;

   Future<void> selectTime(BuildContext context)async{

    final pickedTime= await showTimePicker(
    context: context,
      initialTime: TimeOfDay.now(),
      );

        if(pickedTime!=null){
          selectedHour=pickedTime.hour;
          selectedMinute= pickedTime.minute;
        }
        notifyListeners();

   }
}