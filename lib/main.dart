import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mobile_flutter/provider.dart';
import 'package:mobile_flutter/weather_now.dart';

import 'package:mobile_flutter/weather_on_day.dart';
import 'package:mobile_flutter/weather_on_week.dart';
import 'package:mobile_flutter/load.dart';
import 'package:provider/provider.dart';

import 'icons_row.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Settings>(
        create: (context) => Settings(),
        child: NeumorphicApp(
          title: 'Simply weather app',
          theme: const NeumorphicThemeData(
            intensity: 0.0,
            depth: 0,
          ),
          home: MyHomePage(title: 'Weather app'),
          routes: {
            '/home': (context) => MyHomePage(title: 'Weather app'),
            '/load': (context) => const Load(),
          },
          initialRoute: '/load',
        )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

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
              Text(
                '${Provider.of<Settings>(context).config["location"]}, ${Provider.of<Settings>(context).config["country"]}',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Authentic',
                    color: Colors.white),
                textAlign: TextAlign.left,
              ),
              Container(
                margin: const EdgeInsets.only(top: 34),
                child: Text(
                  Provider.of<Settings>(context)
                      .config["current_dayOfWeek"]
                      .toString()
                      .toUpperCase(),
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Authentic',
                      color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 2),
                child: Text(
                  'sunrise ${Provider.of<Settings>(context).config["sunrise_value"].toString()} am | sunset ${Provider.of<Settings>(context).config["sunset_value"].toString()} pm',
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
                    Settings.tempIndex = toggleIndex;
                    context.read<Settings>().convertTemp(toggleIndex);
                  });
                },
              ),
              const SizedBox(
                height: 50,
              ),
              WeatherOnDay(),
              const SizedBox(height: 50),
              WeatherNow(),
              const SizedBox(height: 50),
              WeatherOnWeek(),
              const SizedBox(height: 5),
              IconsRow(),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}
