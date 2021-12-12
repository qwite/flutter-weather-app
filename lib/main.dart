import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mobile_flutter/weather_on_day.dart';
import 'package:mobile_flutter/weather_on_week.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const NeumorphicApp(
      title: 'Simply weather app',
      theme: NeumorphicThemeData(
        intensity: 0.0,
        depth: 0,
      ),
      home: MyHomePage(title: 'Weather app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int toggleIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A4981),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 17.0, top: 130.0, right: 17),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'San Francisco, CA',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Authentic',
                    color: Colors.white),
                textAlign: TextAlign.left,
              ),
              Container(
                margin: const EdgeInsets.only(top: 34),
                child: const Text(
                  'SAT NOV 10',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Authentic',
                      color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: const Text(
                  'sunrise 6:44 am | sunset 5:02  pm',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Authentic',
                      color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 27,
              ),
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
                      )),
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
              const SizedBox(
                height: 50,
              ),
              WeatherOnDay(),
              const SizedBox(height: 50),
              WeatherOnWeek(),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
