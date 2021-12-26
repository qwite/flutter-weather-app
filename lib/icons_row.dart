import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_flutter/provider.dart';
import 'package:provider/provider.dart';

class IconsRow extends StatelessWidget {
  const IconsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      child: Row(

          // textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                    Provider.of<Settings>(context).getWeatherIcon(0),
                    height: 30,
                    width: 30),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                    Provider.of<Settings>(context).getWeatherIcon(1),
                    height: 30,
                    width: 30),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                    Provider.of<Settings>(context).getWeatherIcon(2),
                    height: 30,
                    width: 30),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                    Provider.of<Settings>(context).getWeatherIcon(3),
                    height: 30,
                    width: 30),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                    Provider.of<Settings>(context).getWeatherIcon(4),
                    height: 30,
                    width: 30),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                    Provider.of<Settings>(context).getWeatherIcon(5),
                    height: 30,
                    width: 30),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                    Provider.of<Settings>(context).getWeatherIcon(6),
                    height: 30,
                    width: 30),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                    Provider.of<Settings>(context).getWeatherIcon(7),
                    height: 30,
                    width: 30),
              ],
            ),
          ]),
    );
  }
}
