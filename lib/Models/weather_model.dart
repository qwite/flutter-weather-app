class WeatherModel {

  final double lat;
  final double lon;
  final String timezone;
  final Current current;
  final List<Daily> daily;

  WeatherModel(
      this.lat,
      this.lon,
      this.timezone,
      this.current,
      this.daily
      );


  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(json['lat'], json['lon'], json['timezone'], Current.fromJson(json['current']), List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))));
  }

}

class Current {

  final int sunrise;
  final int sunset;
  final double temp;

  Current(this.sunrise, this.sunset, this.temp);

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(json['sunrise'], json['sunset'], json['temp']);
  }

}

class Daily {
  final Temp temp;

  Daily(
      this.temp
      );

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(Temp.fromJson(json['temp']));
  }

}

class Temp {
    final double day;
    final double night;
    final double evening;
    final double morning;

    Temp(
        this.day,
        this.night,
        this.evening,
        this.morning
        );

    factory Temp.fromJson(Map<String, dynamic> json) {
      return Temp(json['day'], json['night'], json['eve'], json['morn']);
    }
}