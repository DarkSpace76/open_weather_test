import 'package:open_weather_test/const.dart';
import 'package:open_weather_test/data/api/api.dart';
import 'package:open_weather_test/data/model/data.dart';
import 'package:dio/dio.dart';
import 'package:open_weather_test/data/model/hour_weather.dart';

class OpenWeatherApi extends Api {
  Dio dio = Dio();

  OpenWeatherApi() {
    dio.options.validateStatus = (int? status) {
      return status != null && status > 0;
    };
  }

  @override
  Future<WeatherData> getWeather({double? lat, double? lon}) async {
    final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'lang': 'ru',
          'apiKey': apiKey,
          'units': 'metric'
        });

    return WeatherData.fromJson(response.data);
  }

  @override
  Future<HourWeather> getWeatherHoursDetail(
      {double? lat, double? lon, int? countHour = 8}) async {
    final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/forecast',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'lang': 'ru',
          'cnt': countHour,
          'apiKey': apiKey,
          'units': 'metric'
        });

    return HourWeather.fromJson(response.data);
  }
}
