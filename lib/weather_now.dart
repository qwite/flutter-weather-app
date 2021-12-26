import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_flutter/provider.dart';
import 'package:provider/provider.dart';


class WeatherNow extends StatelessWidget {
  const WeatherNow({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(
          '${Provider.of<Settings>(context).config["current_temp"].toString()}° now',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 60,
          ),
        ),
      ],
    );
  }
}

