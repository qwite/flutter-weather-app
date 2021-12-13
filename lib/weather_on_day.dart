import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_flutter/provider.dart';
import 'package:provider/provider.dart';

class WeatherOnDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'morning',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 19),
            SvgPicture.asset('assets/sun.fill.svg',
                height: 35, width: 35),
            const SizedBox(height: 19),
             Text('${Provider.of<Settings>(context).settings["daily"]["morn_celcius"]}°',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ))
          ],
        ),
        Column(
          children: [
            const Text(
              'day',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 19),
            SvgPicture.asset('assets/cloud.rain.svg',
                height: 35, width: 35),
            const SizedBox(height: 19),
            Text('${Provider.of<Settings>(context).settings["daily"]["day_celcius"]}°',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ))
          ],
        ),
        Column(
          children: [
            const Text(
              'evening',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 19),
            SvgPicture.asset('assets/cloud.svg',
                height: 35, width: 35),
            const SizedBox(height: 19),
            Text('${Provider.of<Settings>(context).settings["daily"]["eve_celcius"]}°',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ))
          ],
        ),
        Column(
          children: [
            const Text(
              'night',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 19),
            SvgPicture.asset('assets/cloud.snow.svg',
                height: 35, width: 35),
            const SizedBox(height: 19),
            Text('${Provider.of<Settings>(context).settings["daily"]["night_celcius"]}°',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ))
          ],
        ),
      ],
    );
  }
}