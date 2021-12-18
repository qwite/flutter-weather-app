import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:mobile_flutter/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:mobile_flutter/api.dart';
import 'package:mobile_flutter/Models/weather_timeline_model.dart';

class Load extends StatefulWidget {
  const Load({
    Key? key,
  }) : super(key: key);

  // creating state
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> with SingleTickerProviderStateMixin {


  void setUp() async {
    await getCurrentDayInfo();
    await getCurrentTime();
    await makeApiRequest();

    Navigator.pushReplacementNamed(context, '/home');
  }
  Future<void> getCurrentTime() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    var time = (now / 1000).round().toString();
    return context.read<Settings>().setCurrentTime(time);
  }

  Future<void> getCurrentDayInfo() async {
    final now = DateTime.now();
    String currentDay = DateFormat('MMMEd').format(now);
    return context.read<Settings>().setCurrentDay(currentDay);
  }

  Future<void> makeApiRequest() async {
    var api = Api();
    WeatherTimeline _timelineModel;
    WeatherTimeline _eveningModel;
    var currentTime = context.read<Settings>().getCurrentTime();
    print(currentTime);

    _timelineModel = await api.getTimelineData("59.985174", "30.384144", currentTime);
    _eveningModel = await api.getEveningData("59.985174", "30.384144");

    print(_timelineModel.hourly.length);
    parseData(_timelineModel.hourly); // обрабатываем данные день-утро
    parseData(_eveningModel.hourly); // обрабатываем данные вечер-ночь

    context.read<Settings>().setSunValues(_timelineModel.current.sunrise, _timelineModel.current.sunset);
    context.read<Settings>().setTempValue(_timelineModel.current.temp);

    var daily_data = context.read<Settings>().getDailyData();
    print(daily_data);


  }

  void parseData(data) {
    var fl = false;

    for (int i = 0; i < data.length; i++) {
      var hour = DateTime.fromMillisecondsSinceEpoch(data[i].dt * 1000);
      var hour_format = DateFormat('hh:mm a').format(hour);
      var temp = data[i].temp;
      var weather = data[i].weather[0].main;
      print(hour_format);

      switch (hour_format) {
        case "06:00 AM":
          context.read<Settings>().pushMorning(temp, weather);
          break;
        case "12:00 PM":
          context.read<Settings>().pushDay(temp, weather);
          break;
        case "06:00 PM":
          context.read<Settings>().pushEvening(temp, weather);
          break;
        case "12:00 AM":
          context.read<Settings>().pushNight(temp, weather);
          fl = true;
          break;
      }

      if (fl) {
        break;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    setUp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A4981),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 170),
            child: const Text(
              'Loading...',
              style: TextStyle(
              color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
