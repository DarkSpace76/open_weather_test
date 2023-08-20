import 'package:flutter/material.dart';

const radialGradient = RadialGradient(
  center: Alignment.center,
  radius: .53,
  colors: <Color>[
    Color(0xFFBD87FF), // yellow sun
    Color(0x00BD87FF),
  ],
);

const bgSplash = LinearGradient(
  colors: [
    Color.fromARGB(255, 41, 1, 173),
    Color(0xff000000),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const bgHome = LinearGradient(
  colors: [
    Color.fromARGB(255, 7, 1, 163),
    Color(0xff000000),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

Color detailBlockBg = Colors.white.withOpacity(.2);

Color currentTime = Colors.white.withOpacity(.4);
