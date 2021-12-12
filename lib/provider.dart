import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Settings extends ChangeNotifier {
  Map settings = {
    "city": "Saint Petersburg",
    "country": "RU",
    "current_dayOfWeek": "TEST",
    "sunrise_value": null,
    "sunset_value": null,
  };



  String setCurrentDay() {
    final now = DateTime.now();
    String currentDay = DateFormat('MMMEd').format(now);
    settings["current_dayOfWeek"] = currentDay;
    notifyListeners();
    return settings["current_dayOfWeek"];
    }

}