import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'Models/weather_model.dart';

class Settings extends ChangeNotifier {
  Map settings = {
    "city": "Saint Petersburg",
    "country": "RU",
    "current_dayOfWeek": null,
    "current_temp_celsius": null,
    "current_temp_fahrenheit": null,
    "sunrise_value": null,
    "sunset_value": null,
    "daily": {
      "day_celcius": "",
      "day_fahrenheit": "",
      "night_celcius": "",
      "night_fahrenheit": "",
      "eve_celcius": "",
      "eve_fahrenheit": "",
      "morn_celcius": "",
      "morn_fahrenheit": "",
    }
  };

  void setCurrentDay(String currentDay) {
     settings["current_dayOfWeek"] = currentDay;
     notifyListeners();
  }

  void setSunValues(int sunrise, int sunset) {
    var sunriseNormalize = DateTime.fromMillisecondsSinceEpoch(sunrise * 1000);
    var sunriseFormat = DateFormat('HH:mm').format(sunriseNormalize); // 31/12/2000, 22:00

    var sunsetNormalize = DateTime.fromMillisecondsSinceEpoch(sunset * 1000);
    var sunsetFormat = DateFormat('HH:mm').format(sunsetNormalize);

    settings["sunrise_value"] = sunriseFormat;
    settings["sunset_value"] = sunsetFormat;
  }

  void setTempValue(double temp) {
    var tempInCelsius = temp.toStringAsFixed(0);
    settings["current_temp_celsius"] = tempInCelsius;
    settings["current_temp_fahrenheit"] = ((int.parse(tempInCelsius) * 1.8) + 32).toStringAsFixed(0);
  }

  void setDailyValue(List<Daily> daily) {
    var dayInCelcius = daily[0].temp.day;
    var nightInCelcius = daily[0].temp.night;
    var eveningInCelcius = daily[0].temp.evening;
    var morningInCelcius = daily[0].temp.morning;
    //
    settings["daily"]["day_celcius"] = dayInCelcius.toStringAsFixed(0);
    settings["daily"]["night_celcius"] = nightInCelcius.toStringAsFixed(0);
    settings["daily"]["eve_celcius"] = eveningInCelcius.toStringAsFixed(0);
    settings["daily"]["morn_celcius"] = morningInCelcius.toStringAsFixed(0);

    settings["daily"]["day_fahrenheit"] = ((dayInCelcius * 1.8) + 32).toStringAsFixed(0);
    settings["daily"]["night_fahrenheit"] = ((nightInCelcius * 1.8) + 32).toStringAsFixed(0);
    settings["daily"]["eve_fahrenheit"] = ((eveningInCelcius * 1.8) + 32).toStringAsFixed(0);
    settings["daily"]["morn_fahrenheit"] = ((morningInCelcius * 1.8) + 32).toStringAsFixed(0);

  }
}