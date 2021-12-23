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
      "morning": {
        "temp": "",
        "weather": ""
      },
      "day": {
        "temp": "",
        "weather": ""
      },
      "evening": {
        "temp": "",
        "weather": ""
      },
      "night": {
        "temp": "",
        "weather": ""
      },
    }
  };

  void pushMorning(temp, weather) {
    settings["daily"]["morning"]["temp"] = temp.round().toString();
    settings["daily"]["morning"]["weather"] = weather;
    notifyListeners();
  }

  void pushDay(temp, weather) {
    settings["daily"]["day"]["temp"] = temp.round().toString();
    settings["daily"]["day"]["weather"] = weather;
    notifyListeners();
  }

  void pushEvening(temp, weather) {
    settings["daily"]["evening"]["temp"] = temp.round().toString();
    settings["daily"]["evening"]["weather"] = weather;
    notifyListeners();
  }

  void pushNight(temp, weather) {
    settings["daily"]["night"]["temp"] = temp.round().toString();
    settings["daily"]["night"]["weather"] = weather;
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
  }


  String getCurrentTime() {
    return settings["current_timeTimestamp"];
  }

  String getMorningTemp() {
    return settings["daily"]["morning"]["temp"];
  }

  String getMorningWeather() {
    return settings["daily"]["morning"]["weather"];
  }

  String getDayTemp() {
    return settings["daily"]["day"]["temp"];
  }

  String getDayWeather() {
    return settings["daily"]["day"]["weather"];
  }

  String getEveningTemp() {
    return settings["daily"]["evening"]["temp"];
  }

  String getEveningWeather() {
    return settings["daily"]["evening"]["weather"];
  }

  String getNightTemp() {
    return settings["daily"]["night"]["temp"];
  }

  String getNightWeather() {
    return settings["daily"]["night"]["weather"];
  }

  Map getDailyData() {
    return settings["daily"];
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

  String getWeatherIcon (dayState) {

    var weather = settings["daily"][dayState]["weather"];
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

  // void setDailyValue(List<Daily> daily) {
  //   var dayInCelcius = daily[0].temp.day;
  //   var nightInCelcius = daily[0].temp.night;
  //   var eveningInCelcius = daily[0].temp.evening;
  //   var morningInCelcius = daily[0].temp.morning;
  //   //
  //   settings["daily"]["day_celcius"] = dayInCelcius.toStringAsFixed(0);
  //   settings["daily"]["night_celcius"] = nightInCelcius.toStringAsFixed(0);
  //   settings["daily"]["eve_celcius"] = eveningInCelcius.toStringAsFixed(0);
  //   settings["daily"]["morn_celcius"] = morningInCelcius.toStringAsFixed(0);
  //
  //   settings["daily"]["day_fahrenheit"] = ((dayInCelcius * 1.8) + 32).toStringAsFixed(0);
  //   settings["daily"]["night_fahrenheit"] = ((nightInCelcius * 1.8) + 32).toStringAsFixed(0);
  //   settings["daily"]["eve_fahrenheit"] = ((eveningInCelcius * 1.8) + 32).toStringAsFixed(0);
  //   settings["daily"]["morn_fahrenheit"] = ((morningInCelcius * 1.8) + 32).toStringAsFixed(0);
  //
  // }
}