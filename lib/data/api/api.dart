import 'package:open_weather_test/data/model/data.dart';
import 'package:open_weather_test/data/model/hour_weather.dart';

abstract class Api {
  Future<WeatherData> getWeather({double? lon, double? lat});
  Future<HourWeather> getWeatherHoursDetail(
      {double? lon, double? lat, int? countHour});
}
