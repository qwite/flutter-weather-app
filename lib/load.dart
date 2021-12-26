import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_flutter/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:mobile_flutter/api.dart';
import 'package:mobile_flutter/Models/weather_timeline_model.dart';

import 'Models/position_model.dart';

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
    // await getCurrentTime();
    await makeApiRequest();

    Navigator.pushReplacementNamed(context, '/home');
  }

  // Future<void> getCurrentTime() async {
  //   final now = DateTime.now().millisecondsSinceEpoch;
  //   var time = (now / 1000).round().toString();
  //   return context.read<Settings>().setCurrentTime(time);
  // }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition() as Position;
    print(position);
    return position;
  }

  Future<void> makeApiRequest() async {
    var api = Api();

    Position pos = await _determinePosition();

    PositionModel _posModel;
    WeatherTimeline _apiModel;
    // var currentTime = context.read<Settings>().getCurrentTime();
    // var key = context.read<Settings>().getCurentDayKey();

    // print(currentTime);

    _posModel = await api.getApiPosition(
        pos.latitude.toString(), pos.longitude.toString());
    context.read<Settings>().setPositionData(_posModel);

    _apiModel = await api.getApiQuery(
        pos.latitude.toString(), pos.longitude.toString());
    context.read<Settings>().setDailyData(_apiModel.daily);
    context.read<Settings>().setConfig(_apiModel.daily[0]); // устанавливаем
    // погоду на сегодня

    context.read<Settings>().setTempValue(_apiModel.current.temp);
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
