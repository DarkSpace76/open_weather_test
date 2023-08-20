import 'package:flutter/material.dart';
import 'package:open_weather_test/components/app_text.dart';

Widget tempData(
    {double? currentTemp,
    String? description,
    double? minTemp,
    double? maxTemp}) {
  return Column(
    children: [
      AppText.custom(
        '${currentTemp?.round() ?? '0'}º',
        color: Colors.white,
      ),
      const SizedBox(height: 5),
      AppText.b1(
        description ?? '',
        color: Colors.white,
      ),
      const SizedBox(height: 5),
      AppText.b1(
        'Макс.: ${maxTemp?.round() ?? ''}º Мин.: ${minTemp?.round() ?? ''}º',
        color: Colors.white,
      )
    ],
  );
}
