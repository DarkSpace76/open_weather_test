import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:open_weather_test/components/app_text.dart';
import 'package:open_weather_test/data/model/data/hour_weather_item.dart';
import 'package:open_weather_test/pages/home/controllers/home_controller.dart';
import 'package:open_weather_test/utils/colors.dart';
import 'package:open_weather_test/utils/icon.dart';

Widget detail(
    {int? utcDate,
    double? windSpeed,
    int? windDirection,
    int? humid,
    List<HourWeatherItem>? listHour}) {
  HomeController controller = Get.find();
  return Expanded(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: 240,
              margin: EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: detailBlockBg,
              ),
              child: Column(
                children: [_caption(utcDate), _devider, _scrollBox(listHour)],
              )),
          Container(
            padding: const EdgeInsets.all(16),
            height: 100,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: detailBlockBg,
            ),
            child: Column(children: [
              _subItemInfo(
                  iconPath: HomeIcon.wind,
                  param1: '${windSpeed ?? ''} м/с',
                  param2: controller.degToDirection(windDirection)),
              const SizedBox(height: 10),
              _subItemInfo(
                  iconPath: HomeIcon.drop,
                  param1: '${humid ?? ''}%',
                  param2: controller.humidToString(humid)),
            ]),
          ),
        ],
      ),
    ),
  );
}

Widget get _devider => Container(
      height: 1,
      width: double.infinity,
      color: Colors.white,
    );

Widget _caption(int? dateLocal) {
  HomeController controller = Get.find();
  initializeDateFormatting();
  var dateFormat = DateFormat.MMMMd('ru');
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText.b2Medium(
          'Cегодня',
          color: Colors.white,
        ),
        AppText.b2(
          dateFormat.format(controller.dateConvert(dateLocal)),
          color: Colors.white,
        ),
      ],
    ),
  );
}

Widget _scrollBox(List<HourWeatherItem>? listHour) {
  return Expanded(
      child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: listHour != null
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listHour.length,
            itemBuilder: (context, index) => _itemScrollBox(listHour[index]),
          )
        : null,
  ));
}

Widget _itemScrollBox(HourWeatherItem item) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    // decoration: item.dt?.hour == DateTime.now().hour ? _selector : null,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            AppText.b2(
              DateFormat('dd.MM').format(item.dt!),
              color: Colors.white,
            ),
            AppText.b2(
              DateFormat('hh:mm').format(item.dt!),
              color: Colors.white,
            ),
          ],
        ),
        Image.asset(
            HomeIcon.getCodeIcon(item.weather?.last.icon, smallIcon: true)),
        AppText.b1Medium(
          '${item.main!.temp?.toInt()}º',
          color: Colors.white,
        ),
      ],
    ),
  );
}

BoxDecoration get _selector => BoxDecoration(
    color: currentTime,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(width: 1, color: Colors.white));

Widget _subItemInfo(
    {required String iconPath, String? param1, String? param2}) {
  return Row(
    children: [
      SizedBox(
          width: 120,
          child: Row(
            children: [
              Row(children: [
                SvgPicture.asset(iconPath),
                const SizedBox(width: 10),
                AppText.b2Medium(
                  param1 ?? '',
                  color: Colors.white.withOpacity(0.2),
                ),
              ]),
            ],
          )),
      Expanded(
        child: AppText.b2(
          param2 ?? '',
          color: Colors.white,
        ),
      ),
    ],
  );
}
