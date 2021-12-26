import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import 'Models/position_model.dart';
import 'Models/weather_timeline_model.dart';

class Settings extends ChangeNotifier {
  Map config = {
    "position_lat": "",
    "position_long": "",
    "location": "",
    "country": "",
    "current_dayOfWeek": "",
    "current_dayOfWeekKey": "",
    "current_timeTimestamp": "",
    "current_temp": "",
    "current_temp_c": "",
    "current_temp_f": "",
    "sunrise_value": "",
    "sunset_value": "",
    "daily": {
      "morning": {"temp": "", "temp_c": "", "temp_f": "", "weather": ""},
      "day": {"temp": "", "temp_c": "", "temp_f": "", "weather": ""},
      "evening": {"temp": "", "temp_c": "", "temp_f": "", "weather": ""},
      "night": {"temp": "", "temp_c": "", "temp_f": "", "weather": ""},
    }
  };

  List<Daily> dailyData = [];
  List dailyKeys = [];

  static var tempIndex = 0;

  List setDailyData(List<Daily> daily) {
    print(daily.length);
    for (var val in daily) {
      var dt = DateTime.fromMillisecondsSinceEpoch(val.dt * 1000);
      String key = DateFormat('E').format(dt).toUpperCase();

      // String key = DateFormat('E').format(DateTime(val.dt)).toUpperCase();
      dailyKeys.add(key);
    }
    log(dailyKeys.toString());

    // log(dailyKeys.toString());

    return dailyData = daily;
  }

  String getKeyFromData(int index) {
    return dailyKeys[index];
  }

  List<Daily> getDailyData() {
    return dailyData;
  }

  void convertTemp(int index) {
    switch (index) {
      case 0:
        config["current_temp"] = config["current_temp_c"];
        config["daily"]["morning"]["temp"] =
            config["daily"]["morning"]["temp_c"];
        config["daily"]["day"]["temp"] = config["daily"]["day"]["temp_c"];
        config["daily"]["evening"]["temp"] =
            config["daily"]["evening"]["temp_c"];
        config["daily"]["night"]["temp"] = config["daily"]["night"]["temp_c"];
        break;
      case 1:
        config["current_temp"] = config["current_temp_f"];
        config["daily"]["morning"]["temp"] =
            config["daily"]["morning"]["temp_f"];
        config["daily"]["day"]["temp"] = config["daily"]["day"]["temp_f"];
        config["daily"]["evening"]["temp"] =
            config["daily"]["evening"]["temp_f"];
        config["daily"]["night"]["temp"] = config["daily"]["night"]["temp_f"];
        break;
    }

    notifyListeners();
  }

  void setConfig(daily) {
    // log(daily.temp.day.toString());
    config["daily"]["morning"]["temp_c"] = daily.temp.morn.round().toString();
    config["daily"]["morning"]["temp_f"] =
        ((int.parse(daily.temp.morn.round().toString()) * 1.8) + 32)
            .toStringAsFixed(0);

    config["daily"]["day"]["temp_c"] = daily.temp.day.round().toString();
    config["daily"]["day"]["temp_f"] =
        ((int.parse(daily.temp.day.round().toString()) * 1.8) + 32)
            .toStringAsFixed(0);

    config["daily"]["evening"]["temp_c"] = daily.temp.eve.round().toString();
    config["daily"]["evening"]["temp_f"] =
        ((int.parse(daily.temp.eve.round().toString()) * 1.8) + 32)
            .toStringAsFixed(0);

    config["daily"]["night"]["temp_c"] = daily.temp.night.round().toString();
    config["daily"]["night"]["temp_f"] =
        ((int.parse(daily.temp.night.round().toString()) * 1.8) + 32)
            .toStringAsFixed(0);

    convertTemp(tempIndex);

    var sunriseNormalize =
        DateTime.fromMillisecondsSinceEpoch(daily.sunrise * 1000);
    var sunriseFormat =
        DateFormat('HH:mm').format(sunriseNormalize); // 31/12/2000, 22:00

    var sunsetNormalize =
        DateTime.fromMillisecondsSinceEpoch(daily.sunset * 1000);
    var sunsetFormat = DateFormat('HH:mm').format(sunsetNormalize);

    config["sunrise_value"] = sunriseFormat;
    config["sunset_value"] = sunsetFormat;

    var dayNormalize = DateTime.fromMillisecondsSinceEpoch(daily.dt * 1000);
    var day = DateFormat('MMMEd').format(dayNormalize);

    config["current_dayOfWeek"] = day;

    notifyListeners();
  }

  void setCurrentTime(String currentTime) {
    config["current_timeTimestamp"] = currentTime;
  }

  String getCurrentTime() {
    return config["current_timeTimestamp"];
  }

  String getMorningTemp() {
    return config["daily"]["morning"]["temp"];
  }

  String getMorningWeather() {
    return config["daily"]["morning"]["weather"];
  }

  String getDayTemp() {
    return config["daily"]["day"]["temp"];
  }

  String getDayWeather() {
    return config["daily"]["day"]["weather"];
  }

  String getEveningTemp() {
    return config["daily"]["evening"]["temp"];
  }

  String getEveningWeather() {
    return config["daily"]["evening"]["weather"];
  }

  String getNightTemp() {
    return config["daily"]["night"]["temp"];
  }

  String getNightWeather() {
    return config["daily"]["night"]["weather"];
  }

  void setPositionData(PositionModel pos) {
    config["location"] = pos.name;
    config["country"] = pos.sys.country;

    notifyListeners();
  }

  void setTempValue(num temp) {
    var tempInCelsius = temp.toStringAsFixed(0);
    config["current_temp_c"] = tempInCelsius;
    config["current_temp_f"] =
        ((int.parse(tempInCelsius) * 1.8) + 32).toStringAsFixed(0);

    log(tempInCelsius.toString());
    config["current_temp"] = config["current_temp_c"];
  }

  void setPosition(Position pos) {
    config["position_lat"] = pos.latitude;
    config["position_long"] = pos.longitude;
  }

// String getWeatherIcon(dayState, key) {
//   var weather = config["daily"][dayState]["weather"];
//   var asset = "";
//   switch (weather) {
//     case "Sun":
//       asset = "sun.fill";
//       break;
//     case "Clouds":
//       asset = "cloud";
//       break;
//     case "Rain":
//       asset = "cloud.rain";
//       break;
//     case "Snow":
//       asset = "cloud.snow";
//   }
//
//   return "assets/$asset.svg";
// }
}
