import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class WeatherOnWeek extends StatefulWidget {
  @override
  State<WeatherOnWeek> createState() => _WeatherOnWeekState();
}

class _WeatherOnWeekState extends State<WeatherOnWeek> {
  int toggleIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        NeumorphicToggle(
          style: const NeumorphicToggleStyle(
            disableDepth: true,
            backgroundColor: Color(0xff4A4981),

            // borderRadius: BorderRadius.circular(15),
          ),
          width: 196,
          height: 32,
          children: [
            ToggleElement(
                background: const Center(
                  child: Text(
                    'C',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                foreground: const Center(
                  child: Text(
                    'C',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                )),
            ToggleElement(
              background: const Center(
                child: Text(
                  'F',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              foreground: const Center(
                child: Text(
                  'F',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ],
          thumb: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          selectedIndex: toggleIndex,
          onChanged: (index) {
            setState(() {
              toggleIndex = index;
            });
          },
        ),
      ],
    );
  }
}
