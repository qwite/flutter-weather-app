import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_flutter/provider.dart';
import 'package:provider/provider.dart';

import 'Models/weather_timeline_model.dart';

class WeatherOnWeek extends StatefulWidget {
  @override
  State<WeatherOnWeek> createState() => _WeatherOnWeekState();
}

class _WeatherOnWeekState extends State<WeatherOnWeek> {
  int toggleIndex = 0;

  ToggleElement _toggle(String day) {
    return ToggleElement(
      background: Center(
        child: Text(
          day,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
      foreground: Center(
        child: Text(
          day,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Daily> dailyData = context.read<Settings>().getDailyData();

    return Row(
      // verticalDirection: VerticalDirection.down,
      textDirection: TextDirection.ltr,

      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          children: [
            NeumorphicToggle(
              style: NeumorphicToggleStyle(
                disableDepth: true,
                backgroundColor: Color(0xff4A4981),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 360,
              height: 39,
              children: <ToggleElement>[
                for (var i = 0; i < 8; i++)
                  _toggle(Provider.of<Settings>(context).getKeyFromData(i)),
              ],
              thumb: Container(
                decoration: const BoxDecoration(
                  color: Color(0xff6A639F),
                ),
              ),
              selectedIndex: toggleIndex,
              onChanged: (index) {
                setState(() {
                  toggleIndex = index;
                  print(dailyData[toggleIndex]);
                  context.read<Settings>().setConfig(dailyData[toggleIndex]);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
