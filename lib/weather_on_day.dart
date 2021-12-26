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
            const SizedBox(height: 5),
            Text('${Provider.of<Settings>(context).getMorningTemp()}°',
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
            const SizedBox(height: 5),
            Text('${Provider.of<Settings>(context).getDayTemp()}°',
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
            // SvgPicture.asset(
            //     '${Provider.of<Settings>(context).getWeatherIcon("evening", key)}',
            //     height: 35,
            //     width: 35),
            const SizedBox(height: 5),
            Text('${Provider.of<Settings>(context).getEveningTemp()}°',
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
            const SizedBox(height: 5),
            Text('${Provider.of<Settings>(context).getNightTemp()}°',
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
