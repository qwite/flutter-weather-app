import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      title: 'Flutter Demo',
      theme: NeumorphicThemeData(
        intensity: 0.0,
        depth: 0,
      ),
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   scaffoldBackgroundColor: Color(0xFF4A4981)
      // ),
      home: const MyHomePage(title: 'Weather app'),
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
      backgroundColor: Color(0xFF4A4981),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 17.0, top: 130.0, right: 17),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
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
                child: Text(
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
                child: Text(
                  'sunrise 6:44 am | sunset 5:02  pm',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Authentic',
                      color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 27,
              ),
              Container(
                child: NeumorphicToggle(
                  style: NeumorphicToggleStyle(
                    disableDepth: true,
                    backgroundColor: const Color(0xff4A4981),

                    // borderRadius: BorderRadius.circular(15),
                  ),
                  width: 196,
                  height: 32,
                  children: [
                    ToggleElement(
                        background: Center(
                          child: Text(
                            'F',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        foreground: Center(
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
                      background: Center(
                        child: Text(
                          'C',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      foreground: Center(
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
              ),
              SizedBox(
                height: 27,
              ),
              Container(
                // padding: EdgeInsets.only(left: 10, right: 17),
                child: Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'morning',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 19),
                        SvgPicture.asset('assets/sun.fill.svg',
                            height: 35, width: 35),
                        SizedBox(height: 19),
                        Text('45°',
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
                        Text(
                          'afternoon',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 19),
                        SvgPicture.asset('assets/cloud.rain.svg',
                            height: 35, width: 35),
                        SizedBox(height: 19),
                        Text('18°',
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
                        Text(
                          'evening',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 19),
                        SvgPicture.asset('assets/cloud.svg',
                            height: 35, width: 35),
                        SizedBox(height: 19),
                        Text('22°',
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
                        Text(
                          'night',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 19),
                        SvgPicture.asset('assets/cloud.snow.svg',
                            height: 35, width: 35),
                        SizedBox(height: 19),
                        Text('30°',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Container(
                  child: Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(7),

                      decoration: BoxDecoration(
                      color: Color(0xff6A639F),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'MON',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TUE',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'WED',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'THU',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'FRI',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SAT',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SUN',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
              ),
                ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
