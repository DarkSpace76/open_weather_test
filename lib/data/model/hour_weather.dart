import 'package:json_annotation/json_annotation.dart';
import 'package:open_weather_test/data/model/data/city.dart';
import 'package:open_weather_test/data/model/data/hour_weather_item.dart';

part 'hour_weather.g.dart';

@JsonSerializable()
class HourWeather {
  @JsonKey(name: 'cnt')
  int? countHour;
  @JsonKey(fromJson: _jsonToList)
  List<HourWeatherItem>? list;
  City? city;

  HourWeather({this.countHour, this.list, this.city});

  factory HourWeather.fromJson(Map<String, dynamic> json) =>
      _$HourWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$HourWeatherToJson(this);

  static List<HourWeatherItem>? _jsonToList(List<dynamic>? value) {
    if (value == null) return null;
    List<HourWeatherItem> list =
        value.map((e) => HourWeatherItem.fromJson(e)).toList();
    return list;
  }
}
