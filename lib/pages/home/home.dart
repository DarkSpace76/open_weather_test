import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:open_weather_test/pages/home/components/big_icon.dart';
import 'package:open_weather_test/pages/home/components/detail.dart';
import 'package:open_weather_test/pages/home/components/temo_data.dart';
import 'package:open_weather_test/pages/home/controllers/home_controller.dart';
import 'package:open_weather_test/utils/colors.dart';

import 'components/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    });
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(gradient: bgHome),
          child: homeController.isLoad
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      location(context,
                          location:
                              '${homeController.weatherData?.name ?? ''}, ${Country.tryParse(homeController.weatherData?.sys?.country ?? '')?.name ?? ''}'),
                      bigIcon(
                          assets:
                              homeController.weatherData?.weather?.last.icon),
                      tempData(
                        description: homeController
                            .weatherData?.weather?.last.description,
                        currentTemp: homeController.weatherData?.main?.temp,
                        minTemp: homeController.weatherData?.main?.tempMin,
                        maxTemp: homeController.weatherData?.main?.tempMax,
                      ),
                      detail(
                          utcDate: homeController.weatherData?.dt,
                          windSpeed: homeController.weatherData?.wind?.speed,
                          windDirection:
                              homeController.weatherData?.wind?.deg?.toInt(),
                          humid: homeController.weatherData?.main?.humidity,
                          listHour: homeController.hourWeather?.list)
                    ]))),
    ));
  }
}
