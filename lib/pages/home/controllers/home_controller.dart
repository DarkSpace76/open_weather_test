import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:open_weather_test/data/api/api.dart';
import 'package:open_weather_test/data/api/open_weather_api.dart';
import 'package:open_weather_test/data/model/data.dart';
import 'package:open_weather_test/data/model/hour_weather.dart';

class HomeController extends GetxController {
  Api api = OpenWeatherApi();
  RxBool loading = false.obs;
  bool get isLoad => loading.value;

  final _weatherDataValue = Rx<WeatherData?>(null);
  final _hourWeatherValue = Rx<HourWeather?>(null);
  WeatherData? get weatherData => _weatherDataValue.value;
  HourWeather? get hourWeather => _hourWeatherValue.value;

  HomeController() {
    loadWeather();
  }
  void setLoad(bool value) {
    loading.value = value;
  }

  void loadWeather() async {
    setLoad(true);

    final isStorage = loadLastData();
    if (isStorage) setLoad(false);

    _determinePosition().then((pos) async {
      _weatherDataValue.value =
          await api.getWeather(lat: pos.latitude, lon: pos.longitude);
      _hourWeatherValue.value = await api.getWeatherHoursDetail(
          lat: pos.latitude, lon: pos.longitude);

      saveLastData();
    }).catchError((onError) {
      if (!isStorage) Get.back();
      Get.snackbar('Error', onError);
    });

    setLoad(false);
  }

  DateTime dateConvert(int? timestamp) {
    if (timestamp != null) {
      return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    }
    return DateTime.now();
  }

  String degToDirection(int? deg) {
    if (deg == null) return '';

    String prefix = 'Ветер';
    if (deg == 0 || deg == 360) return '${prefix} северный';
    if (deg == 90) return '${prefix} восточный';
    if (deg == 270) return '${prefix} Западный';
    if (deg == 180) return '${prefix} южный';
    if (deg > 0 && deg < 90) return '${prefix} северо-восточный';
    if (deg > 90 && deg < 180) return '${prefix} юго-восточный';
    if (deg > 180 && deg < 270) return '${prefix} юго-западный';
    if (deg > 270 && deg < 360) return '${prefix} северо-западный';

    return '';
  }

  String humidToString(int? humid) {
    if (humid == null) return '';

    if (humid < 30) return 'Очень сухой воздух';
    if (humid >= 30 && humid < 55) return 'Сухой воздух';
    if (humid >= 55 && humid < 70) return 'Умеренно сухой воздух';
    if (humid >= 70 && humid < 85) return 'Умеренно влажный воздух';
    if (humid >= 85) return 'Высокая влажность';
    return '';
  }

  void saveLastData() {
    final storage = GetStorage();
    storage.write('weatherLastData', jsonEncode(weatherData));
    storage.write('weatherHoursLastData', jsonEncode(hourWeather));
  }

  bool loadLastData() {
    final storage = GetStorage();
    final jsonWeather = storage.read('weatherLastData');
    final jsonHoursWeather = storage.read('weatherHoursLastData');
    if (jsonWeather == null || jsonHoursWeather == null) return false;
    _weatherDataValue.value = WeatherData.fromJson(jsonDecode(jsonWeather));
    _hourWeatherValue.value =
        HourWeather.fromJson(jsonDecode(jsonHoursWeather));
    return true;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Cлужба GPS отключена.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Разрешения на местоположение запрещены');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
