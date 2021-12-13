import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Models/weather_model.dart';

// https://api.openweathermap.org/data/2.5/onecall?lat=59.985174&lon=30.384144&exclude=hourly&appid=4dc1f9be001147a7adc779dc087c2a9d

class Api {
  String endPoint = "api.openweathermap.org";
  String apiUrl = "data/2.5/onecall";
  String apiKey = "4dc1f9be001147a7adc779dc087c2a9d";

  Future<WeatherModel> getWeatherData(String lat, String lon) async {
    Map<String, String> queryParams = {
      'appid': apiKey,
      'lat': lat,
      'lon': lon,
      'exclude': 'hourly',
      "units": 'metric'
    };

    var client = http.Client();
    var uri = Uri.https(endPoint, apiUrl, queryParams);
    var weatherModel;
    try {
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        weatherModel = WeatherModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return weatherModel;
    }

    return weatherModel;

  }
}
