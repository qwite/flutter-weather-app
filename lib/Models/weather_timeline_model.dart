// Модель для утро-день
class WeatherTimeline {

  final Current current;
  final List<Hourly> hourly;
  final List<Daily> daily;

  WeatherTimeline(this.current, this.hourly, this.daily);

  factory WeatherTimeline.fromJson(Map<String, dynamic> json) {
    return WeatherTimeline(
        Current.fromJson(json['current']),
        List<Hourly>.from(json['hourly'].map((x) => Hourly.fromJson(x))),
        List<Daily>.from(json['daily'].map((x) => Daily.fromJson(x))));
  }

  @override
  String toString() {
    return 'WeatherTimeline{current: $current, hourly: $hourly, daily: $daily}';
  }
}

class Current {

  final int sunrise;
  final int sunset;
  final num temp;

  Current(this.sunrise, this.sunset, this.temp);

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(json['sunrise'], json['sunset'], json['temp']);
  }

  @override
  String toString() {
    return 'Current{sunrise: $sunrise, sunset: $sunset, temp: $temp}';
  }
}

class Hourly {
  final int dt;
  final num temp;
  final List<Weather> weather;

  Hourly(this.dt, this.temp, this.weather);

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(json['dt'], json['temp'],
        List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))));
  }

  @override
  String toString() {
    return 'Hourly{dt: $dt, temp: $temp, weather: $weather}';
  }
}

class Weather {
  final String main;

  Weather(this.main);

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(json['main']);
  }

  @override
  String toString() {
    return 'Weather{main: $main}';
  }
}

class Daily {
  final int dt;
  final int sunrise;
  final int sunset;
  final Temp temp;

  Daily(this.dt, this.sunrise, this.sunset, this.temp);

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(json['dt'], json['sunrise'], json['sunset'],
        Temp.fromJson(json['temp']));
  }

  @override
  String toString() {
    return 'Daily{dt: $dt, sunrise: $sunrise, sunset: $sunset, temp: $temp}';
  }
}

class Temp {
  final num day;
  final num night;
  final num eve;
  final num morn;

  Temp(this.day, this.night, this.eve, this.morn);

  factory Temp.fromJson(Map<String, dynamic> json) {
    return Temp(json['day'], json['night'], json['eve'], json['morn']);
  }

  @override
  String toString() {
    return 'Temp{day: $day, night: $night, eve: $eve, morn: $morn}';
  }
}