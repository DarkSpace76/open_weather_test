import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_weather_test/components/app_text.dart';
import 'package:open_weather_test/utils/icon.dart';

Widget location(BuildContext context, {String? location}) {
  return SizedBox(
    height: 72,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(children: [
        SvgPicture.asset(
          HomeIcon.pin,
          height: 24,
          width: 24,
        ),
        const SizedBox(width: 5),
        AppText.b2Medium(
          location ?? '',
          color: Colors.white,
        )
      ]),
    ),
  );
}
