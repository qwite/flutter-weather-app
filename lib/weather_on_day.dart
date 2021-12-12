import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            const Text('45°',
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
              'afternoon',
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
            const Text('18°',
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
            const Text('22°',
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
            const Text('30°',
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