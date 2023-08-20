import 'package:flutter/material.dart';
import 'package:open_weather_test/utils/colors.dart';
import 'package:open_weather_test/utils/icon.dart';

Widget bigIcon({String? assets}) {
  return SizedBox(
    width: 200,
    height: 200,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Transform.translate(
            offset: const Offset(0, -30),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(gradient: radialGradient),
            ),
          ),
        ),
        if (assets != null)
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 180,
              width: 180,
              child: Image.asset(HomeIcon.getCodeIcon(assets)),
            ),
          ),
      ],
    ),
  );
}
