import 'package:open_weather_test/data/model/data/coord.dart';
import 'package:open_weather_test/data/model/data/main.dart';
import 'package:open_weather_test/data/model/data/rain.dart';
import 'package:open_weather_test/data/model/data/sys.dart';
import 'package:open_weather_test/data/model/data/weather.dart';
import 'package:open_weather_test/data/model/data/wind.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class WeatherData {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Rain? rain;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherData(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.rain,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
