import 'package:flutter/material.dart';
import 'package:check_flutter/modules/enum.dart';


class SelectDate with ChangeNotifier{

  DateTime currentDate = DateTime.now();
  DateTime firstSelect = DateTime.now();
  DateTime secondSelect = DateTime.now().add(Duration(days: 10));

  Future<void> selectDate(BuildContext context,
      {@required SelectedDate selectedDate}) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate == SelectedDate.dateBeginning
            ? currentDate
            : secondSelect,
        firstDate: DateTime(1900),
        lastDate: DateTime(2033));
    if (pickedDate != null &&
        pickedDate != firstSelect &&
        pickedDate != secondSelect) {
      if (selectedDate == SelectedDate.dateBeginning) {
          firstSelect = pickedDate;

      } else if (selectedDate == SelectedDate.dateEnd) {
          secondSelect = pickedDate;

      }
    }
    notifyListeners();
  }
}