import 'package:open_weather_test/data/model/data/main.dart';
import 'package:open_weather_test/data/model/data/weather.dart';
import 'package:open_weather_test/data/model/data/wind.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hour_weather_item.g.dart';

@JsonSerializable()
class HourWeatherItem {
  @JsonKey(fromJson: _unixToDateTime, toJson: _dateTimeToUnix)
  DateTime? dt;
  Main? main;
  List<Weather>? weather;
  Wind? wind;

  HourWeatherItem({this.dt, this.main, this.weather, this.wind});

  factory HourWeatherItem.fromJson(Map<String, dynamic> json) =>
      _$HourWeatherItemFromJson(json);

  Map<String, dynamic> toJson() => _$HourWeatherItemToJson(this);

  static _unixToDateTime(int? timestamp) {
    if (timestamp == null) return DateTime.now();
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  }

  static int _dateTimeToUnix(DateTime? timestamp) {
    return timestamp!.toUtc().millisecondsSinceEpoch ~/ 1000;
  }
}
