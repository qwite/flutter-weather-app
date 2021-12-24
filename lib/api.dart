import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:mobile_flutter/Models/weather_timeline_model.dart';

// https://api.openweathermap.org/data/2.5/onecall?lat=59.985174&lon=30.384144&exclude=hourly&appid=4dc1f9be001147a7adc779dc087c2a9d
// https://api.openweathermap.org/data/2.5/onecall/timemachine?lat=59.985174&lon=30.384144&units=metric&dt=1640330886&appid=4dc1f9be001147a7adc779dc087c2a9d

class Api {
  String endPoint = "api.openweathermap.org";
  String eveningApiUrl = "data/2.5/onecall";
  String timelineApiUrl = "data/2.5/onecall/timemachine";
  String apiKey = "4dc1f9be001147a7adc779dc087c2a9d";

  Future<WeatherTimeline?> getTimelineData(
      String lat, String lon, String current_time) async {
    Map<String, String> queryParams = {
      'appid': apiKey,
      'lat': lat,
      'lon': lon,
      'units': 'metric',
      'dt': current_time,
    };

    var client = http.Client();
    var uri = Uri.https(endPoint, timelineApiUrl, queryParams);
    var timelineModel;

    try {
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        log('inside if');
        timelineModel = WeatherTimeline.fromJson(jsonMap);
      }
    } catch (Exception) {
      return null;
    }
    log(timelineModel.toString());
    return timelineModel;
  }

  Future<WeatherTimeline> getEveningData(String lat, String lon) async {
    Map<String, String> queryParams = {
      'appid': apiKey,
      'lat': lat,
      'lon': lon,
      'units': 'metric',
      'exclude': 'minutely'
    };

    var client = http.Client();
    var uri = Uri.https(endPoint, eveningApiUrl, queryParams);
    var eveningModel;
    try {
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        eveningModel = WeatherTimeline.fromJson(jsonMap);
      }
    } catch (Exception) {
      return eveningModel;
    }

    return eveningModel;
  }

}
