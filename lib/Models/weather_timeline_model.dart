// Модель для утро-день

class WeatherTimeline {

  final Current current;
  final List<Hourly> hourly;

  WeatherTimeline(
      this.current,
      this.hourly
      );

  factory WeatherTimeline.fromJson(Map<String, dynamic> json) {
    return WeatherTimeline(Current.fromJson(json['current']),List<Hourly>.from(json['hourly'].map((x) => Hourly.fromJson(x))));
  }


}

class Current {

  final int sunrise;
  final int sunset;
  final double temp;

  Current(
      this.sunrise,
      this.sunset,
      this.temp
      );

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(json['sunrise'], json['sunset'], json['temp']);
  }

}

class Hourly {
  final int dt;
  final double temp;
  final List<Weather> weather;

  Hourly(this.dt, this.temp, this.weather);

  factory Hourly.fromJson(Map<String, dynamic> json) {
      return Hourly(json['dt'], json['temp'], List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))));

  }
}

class Weather {
  final String main;

  Weather(this.main);

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(json['main']);
  }
}