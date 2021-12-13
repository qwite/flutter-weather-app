import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:mobile_flutter/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:mobile_flutter/api.dart';
import 'package:mobile_flutter/Models/weather_model.dart';

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
    await makeApiRequest();
    Navigator.pushReplacementNamed(context, '/home');
  }

  Future<void> getCurrentDayInfo() async {
    final now = DateTime.now();
    String currentDay = DateFormat('MMMEd').format(now);
    return context.read<Settings>().setCurrentDay(currentDay);
  }

  Future<void> makeApiRequest() async {
    var api = Api();
    WeatherModel _weatherModel;

    _weatherModel = await api.getWeatherData("59.985174", "30.384144");
    context.read<Settings>().setSunValues(_weatherModel.current.sunrise, _weatherModel.current.sunset);
    context.read<Settings>().setTempValue(_weatherModel.current.temp);
    context.read<Settings>().setDailyValue(_weatherModel.daily);

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
