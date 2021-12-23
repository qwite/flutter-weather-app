import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Settings extends ChangeNotifier {
   Map settings = {
    "city": "Saint Petersburg",
    "country": "RU",
    "current_dayOfWeek": "",
    "current_dayOfWeekKey": "",
    "current_timeTimestamp": "",
    "current_temp_celsius": "",
    "current_temp_fahrenheit": "",
    "sunrise_value": "",
    "sunset_value": "",
    "daily": {
      "morning": {"temp": "", "weather": ""},
      "day": {"temp": "", "weather": ""},
      "evening": {"temp": "", "weather": ""},
      "night": {"temp": "", "weather": ""},
    }
  };

   static Map weekly_config = {
    "MON": {}, "TUE": {}, "WED": {}, "THU": {}, "FRI": {}, "SAT": {}, "SUN": {},
  };

  void pushMorning(temp, weather, key) {
    weekly_config[key]["morning"]["temp"] = temp.round().toString();
    weekly_config[key]["morning"]["weather"] = weather;
    notifyListeners();
  }

  void pushDay(temp, weather, key) {
    weekly_config[key]["day"]["temp"] = temp.round().toString();
    weekly_config[key]["day"]["weather"] = weather;
    notifyListeners();
  }

  void pushEvening(temp, weather, key) {
    weekly_config[key]["evening"]["temp"] = temp.round().toString();
    weekly_config[key]["evening"]["weather"] = weather;
    notifyListeners();
  }

  void pushNight(temp, weather, key) {
    weekly_config[key]["night"]["temp"] = temp.round().toString();
    weekly_config[key]["night"]["weather"] = weather;
    notifyListeners();
  }

  void setCurrentDay(String currentDay, String currentDayKey) {
    settings["current_dayOfWeek"] = currentDay;
    settings["current_dayOfWeekKey"] = currentDayKey;

    notifyListeners();
  }

  void setCurrentTime(String currentTime) {
    settings["current_timeTimestamp"] = currentTime;
  }

  String getCurentDayKey() {
    return settings["current_dayOfWeekKey"];
    notifyListeners();
  }

  String getCurrentTime() {
    return settings["current_timeTimestamp"];
  }

  String getMorningTemp(key) {
    return weekly_config[key]["morning"]["temp"];
  }

  String getMorningWeather(key) {
    return weekly_config[key]["morning"]["weather"];
  }

  String getDayTemp(key) {
    return weekly_config[key]["day"]["temp"];
  }

  String getDayWeather(key) {
    return weekly_config[key]["day"]["weather"];
  }

  String getEveningTemp(key) {
    return weekly_config[key]["evening"]["temp"];
  }

  String getEveningWeather(key) {
    return weekly_config[key]["evening"]["weather"];
  }

  String getNightTemp(key) {
    return weekly_config[key]["night"]["temp"];
  }

  String getNightWeather(key) {
    return weekly_config[key]["night"]["weather"];
  }

  Map getDailyData() {
    return weekly_config;
  }

  void setSunValues(int sunrise, int sunset) {
    var sunriseNormalize = DateTime.fromMillisecondsSinceEpoch(sunrise * 1000);
    var sunriseFormat =
        DateFormat('HH:mm').format(sunriseNormalize); // 31/12/2000, 22:00

    var sunsetNormalize = DateTime.fromMillisecondsSinceEpoch(sunset * 1000);
    var sunsetFormat = DateFormat('HH:mm').format(sunsetNormalize);

    settings["sunrise_value"] = sunriseFormat;
    settings["sunset_value"] = sunsetFormat;
  }

  void setTempValue(double temp) {
    var tempInCelsius = temp.toStringAsFixed(0);
    settings["current_temp_celsius"] = tempInCelsius;
    settings["current_temp_fahrenheit"] =
        ((int.parse(tempInCelsius) * 1.8) + 32).toStringAsFixed(0);
  }

  String getWeatherIcon(dayState, key) {
    var weather = weekly_config[key][dayState]["weather"];
    var asset = "";
    switch (weather) {
      case "Sun":
        asset = "sun.fill";
        break;
      case "Clouds":
        asset = "cloud";
        break;
      case "Rain":
        asset = "cloud.rain";
        break;
      case "Snow":
        asset = "cloud.snow";
    }

    return "assets/$asset.svg";
  }
}
